import 'package:flutter/material.dart';

import 'AnswerList.dart';

void main() {
  runApp(new article());
}
const data_wenda = "问答";

const TITLE = '帖子';
final List<ChatMessage> _messages = <ChatMessage>[
  ChatMessage(
    text: '码云是一个活动票务管理系统，为您方便的创建一个可以在线报名，使用二维码签到的活动，并且针对中小活动免费使用·只需注册网站，发布活动后，将活动报名地址共享给用户即可。',
  ),
  ChatMessage(
    text: 'Git(读音为/gɪt/。)是一个开源的分布式版本控制系统，可以有效、高速地处理从很小到非常大的项目版本管理。Git 是 Linus Torvalds 为了帮助管理 Linux 内核开发而开发的一个开放源码的版本控制软件。'  )
];
class article extends StatelessWidget {
  const article({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext ctxt, int index) {
        if (index == 0 ) {
          return _messages[0];
        }
      },
      itemCount: 2,
    );
  }
}

const String _name1 = "恩博教育";
const String title = "码云是什么？";
class ChatMessage extends StatelessWidget {
  ChatMessage({this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: new BoxDecoration(
            border: new Border(
                bottom:
                new BorderSide(width: 1.0, color: const Color(0xff999999))
              // color:const Color(0xff6d9eeb),
            )),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child:
    GestureDetector(
    onTap: () {
    print("这是聊天界面");
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new AnswerList()));
    },
    child:new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(title,
                        style: TextStyle(fontSize: 20.0,
                          fontWeight: FontWeight.w100,)),
                    new Container(
                      width: 390.0,
                      margin: const EdgeInsets.only(top: 9.0),
                      child: new Text(text, softWrap: true,),
                    ),
                    new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          new Container(
                              child: new CircleAvatar(
                                backgroundImage: new AssetImage("images/recommendInstitution2.jpg"),
                              )),
                          new Container(
                            width:40,
//                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                            child: new Text('Bill',
                                softWrap: true, textAlign: TextAlign.center),
                          ),
                          new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                new Container(
                                  width:290,
//                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                                  child: new Text('阅读数 38 | 评论',
                                      softWrap: true, textAlign: TextAlign.right),
                                ),
                              ]),

                        ])
                  ]),
            ])));
  }
}
