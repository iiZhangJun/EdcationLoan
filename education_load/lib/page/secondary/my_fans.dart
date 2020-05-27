import 'package:flutter/material.dart';
import 'package:flutter_yjh/utils/app_size.dart';
import 'package:flutter_yjh/view/app_topbar.dart';
import 'package:flutter_yjh/view/customize_appbar.dart';

///
/// 我的好友页
///
class MyFansPage extends StatefulWidget {
  @override
  _MyFansPageState createState() => _MyFansPageState();
}

class _MyFansPageState extends State<MyFansPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
            preferredSize: Size.fromHeight(AppSize.height(160)),
            child: CommonBackTopBar(
                title: "我的好友", onBack: () => Navigator.pop(context))),
        body: Container());
  }
}
