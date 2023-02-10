import 'package:v2exf/service/network/api/index.dart';

class NodeApi with JLApi {
  @override
  String? get module => 'nodes';

  static JLApi get all => NodeApi()..path = 'all.json';
}
