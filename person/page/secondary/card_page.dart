import 'package:flutter/material.dart';

class card extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new cardPageState();
  }
}

class cardPageState extends State<card> {
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
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("我的银行卡"),
        ),
        body: new Center(
          child: new ListView(
            children: list,
          ),
        ));
  }
}
