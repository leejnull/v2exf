import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopicDetailPage extends StatefulWidget {
  const TopicDetailPage({super.key});

  @override
  State<StatefulWidget> createState() => _TopicDetailPageState();
}

class _TopicDetailPageState extends State<TopicDetailPage> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          // middle: Text('话题详情'),
          ),
      child: Center(
        child: Text('话题详情'),
      ),
    );
  }
}
