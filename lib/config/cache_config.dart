import 'package:v2exf/config/index.dart';
import 'package:v2exf/model/base.dart';

class CacheConfig extends BaseModel {
  bool enable = Config.enable;
  int maxAge = Config.maxAge;
  int maxCount = Config.maxCount;

  CacheConfig();

  CacheConfig.fromJson(Map<String, dynamic> data) : super.fromJson(data) {
    enable = data["enable"];
    maxAge = data["maxAge"];
    maxCount = data["maxCount"];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'enable': enable,
        'maxAge': maxAge,
        'maxCount': maxCount,
      };
}
