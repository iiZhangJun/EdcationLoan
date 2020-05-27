import 'package:flutter/material.dart';

import 'ModifyAnswer.dart';
import 'package:flutter_yjh/ForumPage/WriteAnswer.dart';
void main() {
  runApp(new AnswerList());
}

class AnswerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '聊天',
      home: new AnswerListScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }
}

class AnswerListScreen extends StatefulWidget {
  @override
  State createState() => new AnswerListScreenState();
}

const TITLE = '帖子';
final List<ChatMessage> _messages = <ChatMessage>[
  ChatMessage(
    text:
    '码云是一个活动票务管理系统，为您方便的创建一个可以在线报名，使用二维码签到的活动，并且针对中小活动免费使用·只需注册网站，发布活动后，将活动报名地址共享给用户即可。',
  )
];

class AnswerListScreenState extends State<AnswerListScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('问答'), centerTitle: true),
        body: new Column(children: <Widget>[
          new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Container(
                  child: new Text(title, textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w100,
                      )),
                )
              ]),
          new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Container(
                  width: 300,
//                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                  child: new Text('3条评论',
                      softWrap: true, textAlign: TextAlign.left),
                ),
                new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Container(
                          width: 90,
//                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                          child: new MaterialButton(
                            color: Colors.deepOrange,
                            textColor: Colors.white,
                            child: new Text('写回答', textAlign: TextAlign.right),
                            onPressed: () {
                              Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new WriteAnswer(title:title)),
            );
                            },
                          )
                      ),
                    ]),
              ]),
          new Flexible(
              child: ListView.builder(
                itemBuilder: (BuildContext ctxt, int index) {
                  if (index == 0) {
                    return _messages[0];
                  }

                },
                itemCount: 2,
              ))
        ]));
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
        child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
        new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[ new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Container(
                      child: new CircleAvatar(
                        backgroundImage: new AssetImage(
                            "images/recommendInstitution2.jpg"),
                      )),
                  new Container(
                    width: 40,
//                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                    child: new Text('Bill',
                        softWrap: true, textAlign: TextAlign.center),
                  ),
                  new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        new Container(
                          width: 290,
//                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                          child: new Text('2019/8/2',
                              softWrap: true,
                              textAlign: TextAlign.right),
                        ),
                      ])]),
                  new Container(
                    width: 390.0,
                    margin: const EdgeInsets.only(top: 9.0),
                    child: new Text(
                      text,
                      softWrap: true,
                    ),
                  ),
                  new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        new Container(
                          width: 120,
//
                        ),
                        new Container(
                          width: 80,
//                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                          child: new Text('删除回答',
                              softWrap: true, textAlign: TextAlign.center),
                        ),
                        GestureDetector(
                            onTap: () {
                              print("这是聊天界面");
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => new ModifyAnswer()));
                            },
                            child:
                        new Container(
                          width: 80,
//                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                          child: new Text('修改回答',
                              softWrap: true, textAlign: TextAlign.center),
                        )),
                        new Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              new Icon(Icons.sms),
                              new Container(
                                width: 80,
//                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                                child: new Text('评论（0）',
                                    softWrap: true,
                                    textAlign: TextAlign.center),
                              )
                            ]),
                      ])
                ]),
            ]));
  }
}
