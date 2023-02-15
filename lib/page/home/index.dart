import 'package:flutter/material.dart';
import 'package:v2exf/service/router/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 技术 创意 好玩 Apple 酷工作 交易 城市 问与答 最热 全部 R2
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pushNamed(
              RoutePath.topicDetail.path,
            );
          },
          child: const Text('详情')),
    );
  }
}
