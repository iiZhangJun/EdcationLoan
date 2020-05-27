import 'package:flutter/material.dart';
import 'package:flutter_yjh/utils/app_size.dart';
import 'package:flutter_yjh/view/app_topbar.dart';
import 'package:flutter_yjh/view/customize_appbar.dart';

///
/// 我的收藏页
///
class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Widget> list = <Widget>[
    new ListTile(
      title: new Text('银行卡号1：******',
          style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
      subtitle: new Text('类型：借记卡  花旗积分：**'),
    ),
    new ListTile(
      title: new Text('银行卡号2：*******',
          style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
      subtitle: new Text('类型：借记卡 花旗积分：**'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
            preferredSize: Size.fromHeight(AppSize.height(160)),
            child: CommonBackTopBar(
                title: "我的银行卡", onBack: () => Navigator.pop(context))),
        body: new Center(
          child: new ListView(
            children: list,
          ),
        ));
  }
}
