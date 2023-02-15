class Config {
  static const http_api_url = 'http://www.v2ex.com/api';
  static const https_api_url = 'https://www.v2ex.com/api';
  static const http_base_url = 'http://www.v2ex.com';
  static const https_base_url = 'https://www.v2ex.com';

  /// 会否启用缓存
  static const enable = true;

  /// 缓存的最长时间，单位（秒）
  static const maxAge = 1000;

  /// 最大缓存数
  static const maxCount = 100;
}
