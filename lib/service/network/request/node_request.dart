import 'package:v2exf/model/node.dart';
import 'package:v2exf/service/logger/index.dart';
import 'package:v2exf/service/network/api/node_api.dart';
import 'package:v2exf/service/network/index.dart';

class NodeRequest {
  static Future<List<Node>> allNodes() async {
    try {
      final resp = await JLNetWork.apiRequest(NodeApi.all);
      List<Node> res = [];
      for (final dict in resp) {
        res.add(Node.fromJson(dict));
      }
      return Future.value(res);
    } catch (e) {
      Logger.error('查询所有节点出错：$e');
      return Future.error(e);
    }
  }
}
