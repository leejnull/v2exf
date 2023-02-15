import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:v2exf/common/global.dart';
import 'package:v2exf/page/root/index.dart';
import 'package:v2exf/service/router/index.dart';

void main() {
  Global.init().then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'v2exf',
      theme: CupertinoThemeData(
        primaryColor: Colors.black12,
      ),
      home: AppRoot(),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
