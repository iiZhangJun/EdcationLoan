import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yjh/CoursePage.dart';
import 'package:flutter_yjh/ForumPage/Forum_page_index.dart';
import 'package:flutter_yjh/MessagePage.dart';
import 'package:flutter_yjh/ShoppingPage.dart';
import 'package:flutter_yjh/page/personal_page.dart';

import 'package:flutter_yjh/utils/app_size.dart';
import 'package:flutter_yjh/utils/constants.dart';

int pageIndex = 0;

class IndexPage extends StatefulWidget {
  IndexPage({pageIndex});

  @override
  _IndexPageState createState() => _IndexPageState();
}

final List<BottomNavigationBarItem> bottomBar = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: Icon(Icons.import_contacts),
      title: Text('课程'),
      activeIcon: Icon(
        (Icons.import_contacts),
        color: Colors.deepOrange,
      )),
  BottomNavigationBarItem(
    icon: Icon(Icons.explore),
    title: Text('论坛'),
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.question_answer,
    ),
    title: Text('消息'),
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.local_grocery_store),
    title: Text('商城'),
  ),
  BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
];

final List<Widget> pages = <Widget>[
  CoursePage(),
  ForumPage(),
  MessagePage(),
  ShoppingPage(),
  PersonalPage()
];

class _IndexPageState extends State<IndexPage>
    with AutomaticKeepAliveClientMixin {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    print(pageIndex);
    currentPage = pages[pageIndex];
    print("--*-- _IndexPageState");
  }

  var currentPage;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // 初始化屏幕适配包
    AppSize.init(context);
    Screen.init(context);
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.deepOrange,
            type: BottomNavigationBarType.fixed,
            currentIndex: pageIndex,
            onTap: (index) {
              setState(() {
                pageIndex = index;
                print(pageIndex);
                currentPage = pages[pageIndex];
//              pageController.jumpToPage(index);
              });
            },
            items: bottomBar),
        body: currentPage

//      body: _getPageBody(context),
        );
  }

  final pageController = PageController();

  _getPageBody(BuildContext context) {
    return PageView(
      controller: pageController,
      children: pages,
      physics: NeverScrollableScrollPhysics(), // 禁止滑动
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
