import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:v2exf/page/home/index.dart';
import 'package:v2exf/page/mine/index.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<StatefulWidget> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  List items = ['v2exf', '我的'];
  List itemPages = [const HomePage(), const MinePage()];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
            selectedIndex == 0 ? Icons.home : Icons.home_outlined,
            color: Colors.black,
          )),
          BottomNavigationBarItem(
              icon: Icon(
            selectedIndex == 1 ? Icons.person : Icons.person_outline,
            color: Colors.black,
          )),
        ],
        backgroundColor: Colors.white,
        onTap: (value) => setState(
          () {
            selectedIndex = value;
          },
        ),
        border: null,
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('${items[index]}'),
                border: null,
                backgroundColor: Colors.white,
              ),
              child: itemPages[index],
            );
          },
        );
      },
    );
  }
}
