import 'package:flutter/material.dart';

void main() {
  runApp(new ChatBoard());
}

class ChatBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '昂立教育',
      home: new ChatScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
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
      text: '亲，可以看看Java提高课程',
    ),
//    ),
//    ChatMessage(
//      text: '注意一下消息注意一下消息注意消息注意一下消息注意一下消息注意消息注意注意',
//    ),
//    ChatMessage(
//      text: '李彪发的地方九宫格消息意一下消息注意一下消息注意消息注意一下消息注意一下消息注意消息注意',
//    ),
//    ChatMessage(
//      text: '你接收不',
//    ),
//    ChatMessage(
//      text: '注意一下消息注意一下消息注意消息注意一下消息注意一下消息注意消息注意注意',
//    )
  ];
  final List<ChatMessage1> _messages1 = <ChatMessage1>[
    ChatMessage1(
      text: '请问还有其他类似的课程可以推荐吗？',
    ),
    ChatMessage1(
      text: '你接收不',
    ),
    ChatMessage1(
      text: '注意一下消息注意一下消息注意一下消息注意一下消息注意消息注意注意',
    ),
    ChatMessage1(
      text: '你接收不',
    ),
    ChatMessage1(
      text: '注意一下消息注意一下消息注意一下消息注意一下消息注意消息注意注意',
    ),
    ChatMessage1(
      text: '李彪发的地方九宫格消意一下消息注意一下消息注意消息注意一下消息注意一下消息注意消息注意息',
    ),
    ChatMessage1(
      text: '你接收不',
    ),
  ];

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage1 message1 = new ChatMessage1(
      text: text,
    );
    setState(() {
      _messages1.insert(0, message1);
    });
  }

  // 响应空白处的焦点的Node
  FocusNode blankNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('昂立教育'),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
        ),
        resizeToAvoidBottomPadding: false, //输入框抵住键盘 内容不随键盘滚动
        body: GestureDetector(
          onTap: () {
            // 点击空白页面关闭键盘
            FocusScope.of(context).requestFocus(blankNode);
          },
          child: Container(
            color: Color.fromRGBO(96, 96, 150, 0.1),
            //Colors.black12,
            child: new Column(children: <Widget>[
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width-50,
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex:5,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                           Text('Java基础入门'),
                           Text('昂立教育')
                        ],
                    ),
                    ),
                    Expanded(
                      flex:1,
                      child: Text('￥299'),
                    )
                  ],
                ),
              ),
              new Flexible(
                child: new ListView.builder(
//                    padding: new EdgeInsets.all(8.0),
//                    reverse: false,
                  itemBuilder: (BuildContext ctxt, int index) {
                    if (index == 0 ) {
                      return _messages1[0];
                    }
                    if (index == 1) {
                      return _messages[0];
                    }
                  },
                  itemCount: _messages1.length,
                ),
              ),
              new Divider(height: 1.0),
              new Container(
                decoration: new BoxDecoration(
                  color: Theme.of(context).cardColor,
                ),
                child: _buildTextComposer(),
              )
            ]),
          )
        ));
  }

  Widget _buildTextComposer() {
    return new Container(
        height: 50.0,
//        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(children: <Widget>[
          new Flexible(
              child: new TextField(
            maxLines: 90,
            //最大行数
            autocorrect: true,
            //是否自动更正
            controller: _textController,
            onSubmitted: _handleSubmitted,
            decoration: new InputDecoration.collapsed(hintText: '发送消息'),
          )),
          new Container(
//                margin: new EdgeInsets.symmetric(horizontal: 4.0),
            child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text)),
          )
        ]));
  }
//...
}

const String _name = "李彪";

class ChatMessage1 extends StatelessWidget {
  ChatMessage1({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                      width: 220.0,
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 12.0, left: 8.0, right: 8.0),
                      child: new Text(text,
                          softWrap: true, textAlign: TextAlign.left),
                      decoration: new BoxDecoration(
                        //背景
                        color: Colors.blue[200],
                        //设置四周圆角 角度
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        //设置四周边框
                        border:
                            new Border.all(width: 1, color: Colors.blue[200]),
                      )),
                ]),
            new Container(
                margin: const EdgeInsets.only(left: 16.0, top: 5.0),
                child: new CircleAvatar(
                  backgroundImage: AssetImage("images/avatar1.jpeg"),
                  //可以在图片上添加文字等等
                ))
          ]),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(
                backgroundImage: AssetImage("images/recommendInstitution1.jpg"),
                //可以在图片上添加文字等等
              ),
            ),
            new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
//                    new Text(_name, style: Theme.of(context).textTheme.subhead),
                  new Container(
//                      color: Colors.blue,
                      width: 190,
                      //padding: const EdgeInsets.only(top: 8.0, bottom: 12.0,left:8.0, right: 8.0),
                      child: new Container(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 12.0, left: 8.0, right: 8.0),
                        child: new Text(text, softWrap: true),
                        decoration: new BoxDecoration(
                          //背景
                          color: Colors.blue[200],
                          //设置四周圆角 角度
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          //设置四周边框
                          border:
                              new Border.all(width: 1, color: Colors.blue[200]),
                        ),
                      ))
                ]),
          ]),
    );
  }
}
