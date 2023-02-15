import 'package:v2exf/config/cache_config.dart';
import 'package:v2exf/model/base.dart';

/// 用户信息
class Profile extends BaseModel {
  String? token;

  /// 主题索引
  int theme = 0;

  /// 缓存策略信息
  CacheConfig? cache;

  Profile();

  Profile.fromJson(Map<String, dynamic> data) : super.fromJson(data) {
    token = data['token'];
    theme = data['theme'];
    cache = CacheConfig.fromJson(data['cache']);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'token': token,
        'theme': theme,
        'cache': cache?.toJson(),
      };
}
