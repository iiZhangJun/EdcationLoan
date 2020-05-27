import 'package:flutter/material.dart';

import 'components/ChatBoard.dart';

void main() {
  runApp(new MessagePage());
}

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '聊天',
      home: new ChatScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  //...
  final TextEditingController _textController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[
    ChatMessage(
      text: '亲，可以看看这款课程',
    )
  ];
  final List<ChatMessage1> _messages1 = <ChatMessage1>[
    ChatMessage1(
      text: '快递默认发中通呢',
    ),
    ChatMessage1(
      text: '亲，麻烦确认一下订单信息',
    )
  ];

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('聊天'), centerTitle: true),
      body: new Column(children: <Widget>[
        new Flexible(
            child: new ListView.builder(
          padding: new EdgeInsets.all(8.0),
          reverse: false,
          itemBuilder:  (BuildContext ctxt, int index) {
            if (index == 0) {
              return _messages[index];
            }else
              {
              return _messages1[index];
            }
          },
          itemCount: _messages1.length,
        )),
      ]),
    );
  }
}

const String _name = "昂立教育";
const String _name1 = "恩博教育";
const String _name2 = "二手手机";

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
        child: GestureDetector(
            onTap: () {
              print("这是聊天界面");
            },
            child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                      margin: const EdgeInsets.only(right: 16.0),
                      child: new CircleAvatar(
                        backgroundImage: new AssetImage("images/recommendInstitution1.jpg"),
                        //可以在图片上添加文字等等
                      )),
                  GestureDetector(
                    onTap: () {
                      print("hia");
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new ChatBoard()));
                    },
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(_name,
                              style: Theme.of(context).textTheme.subhead),
                          new Container(
                            width: 250.0,
                            margin: const EdgeInsets.only(top: 9.0),
                            child: new Text(text, softWrap: true),
                          )
                        ]),
                  ),
        new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
           children: <Widget>[
                  new Container(
//                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                    child: new Text('9月2日',
                        softWrap: true, textAlign: TextAlign.right),
                  ),
                  new Container(
//                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                    child: new Icon(Icons.chevron_right),
                  )
            ])
                ])));
  }
}


class ChatMessage1 extends StatelessWidget {
  ChatMessage1({this.text});

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
        child: GestureDetector(
            onTap: () {
              print("这是聊天界面");
            },
            child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                      margin: const EdgeInsets.only(right: 16.0),
                      child: new CircleAvatar(
                        backgroundImage: new AssetImage("images/recommendInstitution2.jpg"),
                        //可以在图片上添加文字等等
                      )),
                  GestureDetector(
                    onTap: () {
                      print("hia");
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new ChatBoard()));
                    },
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(_name1,
                              style: Theme.of(context).textTheme.subhead),
                          new Container(
                            width: 250.0,
                            margin: const EdgeInsets.only(top: 9.0),
                            child: new Text(text, softWrap: true),
                          )
                        ]),
                  ),
                  new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        new Container(
//                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                          child: new Text('8月6日',
                              softWrap: true, textAlign: TextAlign.right),
                        ),
                        new Container(
//                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                          child: new Icon(Icons.chevron_right),
                        )
                      ])
                ])));
  }
}