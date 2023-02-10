import 'package:v2exf/service/network/api/index.dart';

class TopicApi with JLApi {
  @override
  String? get module => 'topics';

  /// 获取最热话题
  static JLApi get hotTopics => TopicApi()..path = 'hot.json';

  /// 获取最新话题
  static JLApi get latestTopics => TopicApi()..path = 'latest.json';

  /// 根据节点名获取其话题
  static JLApi topicsByNodeId(int nodeId) {
    final api = TopicApi();
    api.path = 'show.json?node_id=$nodeId';
    return api;
  }
}
