import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v2exf/config/cache_config.dart';
import 'package:v2exf/model/profile.dart';
import 'package:v2exf/service/logger/index.dart';

const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class Global {
  static late SharedPreferences _prefs;
  static Profile profile = Profile();
  // 可选的主题列表
  static List<MaterialColor> get themes => _themes;

  // 是否为release版
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");

  // 初始化全局信息，会在App启动时执行
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _prefs = await SharedPreferences.getInstance();
    var profileCache = _prefs.getString("profile");
    if (profileCache != null) {
      try {
        profile = Profile.fromJson(jsonDecode(profileCache));
      } catch (e) {
        Logger.error('解析profile出错: $e');
      }
    } else {
      profile = Profile()..theme = 0;
    }

    // 如果没有缓存策略，设置默认缓存策略
    profile.cache = profile.cache ?? CacheConfig();
  }

  static saveProfile() =>
      _prefs.setString('profile', jsonEncode(profile.toJson()));
}
