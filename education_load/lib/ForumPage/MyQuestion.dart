import 'package:flutter/material.dart';

class MyQuestion extends StatefulWidget {
  @override
  _MyQuestionState createState() => _MyQuestionState();
}

class _MyQuestionState extends State<MyQuestion> {

  var question_list=[
    {
      "questioneName": "什么是JSON",
      "questionerName": "smile",
      "questionerPicture":"images/avatar1.jpeg",
      "questioneContents": "JSON (JavaScript Object Notation, JS 对象标记) 是一种轻量级的数据交换格式。它基于 ECMAScript (w3c制定的js规范)的一个子集，采用完全独立于编程语言的文本格式来存储和表示数据。简洁和清晰的层次结构使得 JSON 成为理想的数据交换语言。 易于人阅读和编写，同时也易于机器解析和生成，并有效地提升网络传输效率",
      "readingNumber":"21",
      "answersNumber":"9",
    },
    {
      "questioneName": "什么是框架？框架的作用是什么",
      "questionerName": "smile",
      "questionerPicture":"images/avatar1.jpeg",
      "questioneContents": "在编程领域，软件框架是指一种抽象形式，它提供了一个具有通用功能的软件，这些功能可以由使用者编写代码来有选择的进行更改，从而提供服务于特定应用的软件。软件框架提供了一种标准的方式来构建并部署应用",
      "readingNumber":"34",
      "answersNumber":"6",
    },
  ];

  void _dialog(BuildContext context,int index) {
    showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('提示'),

            content: new Text('确定要删除此提问吗？'),
            actions: <Widget>[
              new FlatButton(
                child: new Text('取消'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              new FlatButton(
                child: new Text('确定'),
                onPressed: () {
                  setState(() {
                    question_list.removeAt(index);
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('我的提问'),
        centerTitle: true,
      ),

      body: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: question_list.length,
          itemBuilder: (BuildContext context,int index){
            return InkWell(
              onTap: (){},
              onLongPress: (){
                _dialog(context,index);
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(question_list[index]["questioneName"],style: new TextStyle(fontSize: 17),),
                        ],),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(question_list[index]["questioneContents"],
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(color: Colors.black26),
                            ),
                          )
                        ],),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                ClipOval(
                                  child: Image.asset(question_list[index]["questionerPicture"],width: 25.0,height: 25.0,),
                                ),
                                Padding(padding: EdgeInsets.all(3.0)),
                                Text(question_list[index]["questionerName"],style: new TextStyle(fontSize: 16),)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("阅读数"+ question_list[index]["readingNumber"]+" | 回答"+question_list[index]["answersNumber"],style: new TextStyle(fontSize: 16),),
                                Padding(padding: EdgeInsets.all(3.0))
                              ],
                            )
                          ]),
                    ),
                    Container(height: 1.0,color: Colors.black12),
                  ],),
              ),
            );
          },
        ),
      ),
    );
  }
}

