import 'package:v2exf/service/network/api/index.dart';

class SystemApi with JLApi {
  /// 登出
  static JLApi get signup => SystemApi()..path = 'signup';

  /// 登录
  static JLApi get signin => SystemApi()..path = 'signin';
}
