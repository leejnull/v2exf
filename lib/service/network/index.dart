import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:v2exf/config/index.dart';
import 'package:v2exf/service/network/api/index.dart';

class JLNetWork {
  static String get baseApiUrl {
    // todo: 这里要通过缓存控制是https还是http
    return Config.https_api_url;
  }

  static String get baseUrl {
    // todo: 这里要通过缓存控制是https还是http
    return Config.https_base_url;
  }

  JLNetWork._internal() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.responseType = ResponseType.json;
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        createHttpClient;

    _apiDio.options.baseUrl = baseApiUrl;
    _apiDio.options.responseType = ResponseType.json;
    (_apiDio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        createHttpClient;
  }
  factory JLNetWork() => _instance;
  static final JLNetWork _instance = JLNetWork._internal();

  final _dio = Dio();
  final _apiDio = Dio();

  HttpClient? createHttpClient(HttpClient client) {
    client.findProxy = (uri) {
      return "PROXY localhost:7890";
    };
    client.badCertificateCallback = (cert, host, port) => true;
    return client;
  }

  static Future apiRequest(JLApi api, {Map? params}) async {
    return _request(_instance._apiDio, api, params: params);
  }

  static Future request(JLApi api, {Map? params}) async {
    return _request(_instance._dio, api, params: params);
  }

  static Future _request(Dio dio, JLApi api, {Map? params}) async {
    if (api.method == JLApiMethod.get) {
      Response res = await dio.get(api.fullPath);
      return res.data;
    }
    Response res = await dio.post(api.fullPath, data: params);
    return res.data;
  }
}
