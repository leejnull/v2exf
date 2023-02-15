import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:v2exf/page/error/index.dart';
import 'package:v2exf/page/home/index.dart';
import 'package:v2exf/page/home/topic_detail/index.dart';
import 'package:v2exf/page/mine/index.dart';
import 'package:v2exf/page/root/index.dart';
import 'package:v2exf/service/logger/index.dart';

enum RoutePath {
  /// 根控制器
  root,

  /// 首页
  home,

  /// 话题详情
  topicDetail,

  /// 我的
  mine,

  /// 错误
  error
}

extension RoutePathDesc on RoutePath {
  String get path {
    switch (this) {
      case RoutePath.root:
        return '/root';
      case RoutePath.home:
        return '/home';
      case RoutePath.topicDetail:
        return '/home/topic_detail';
      case RoutePath.mine:
        return '/mine';
      case RoutePath.error:
        return '/error';
    }
  }
}

class AppRouter {
  static Map<String, WidgetBuilder> get routes => {
        RoutePath.root.path: (context) => const CupertinoPageScaffold(
              child: AppRoot(),
            ),
        RoutePath.home.path: (context) => const HomePage(),
        RoutePath.topicDetail.path: (context) => const TopicDetailPage(),
        RoutePath.mine.path: (context) => const MinePage(),
        RoutePath.error.path: (context) => const ErrorPage(),
      };

  static Map<String, String> get routeNames => {
        RoutePath.home.path: 'v2exf',
        RoutePath.mine.path: '我的',
      };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Logger.debug(settings);
    return CupertinoPageRoute(
      builder: (context) {
        final route = routes[settings.name];
        if (route != null) {
          String? name = routeNames[settings.name];
          return CupertinoPageScaffold(
            navigationBar: name != null
                ? CupertinoNavigationBar(
                    middle: Text(name),
                  )
                : null,
            child: route(context),
          );
        } else {
          return const CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('出错'),
            ),
            child: ErrorPage(),
          );
        }
      },
    );
  }
}
