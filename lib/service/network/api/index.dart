import 'package:v2exf/config/index.dart';

enum JLApiMethod { get, post, put, delete }

mixin JLApi {
  static const api_latest = '/topics/latest.json';
  static const api_hot = '/topics/hot.json';
  static const api_all_node = '/nodes/all.json';
  static const api_replies = '/replies/show.json';
  static const api_topic = '/topics/show.json';
  static const api_user = '/members/show.json';

  String? version;

  String? module;

  String? path;

  JLApiMethod method = JLApiMethod.get;

  String get fullPath {
    final items = [version ?? '', module ?? '', path ?? '']
        .where((element) => element.isNotEmpty);
    return '/${items.join('/')}';
  }
}
