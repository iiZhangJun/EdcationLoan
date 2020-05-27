import 'package:flutter/material.dart';
import 'package:flutter_yjh/page/index_page.dart';

import 'Forum_page_index.dart';


class AskQuestion extends StatefulWidget {
  @override
  _AskQuestionState createState() => _AskQuestionState();
}

class _AskQuestionState extends State<AskQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        leading: InkWell(
          onTap: (){Navigator.of(context).pop();},
          child: Container(
            height: 36,
            alignment: Alignment.center,
            child: Text('取消',style: TextStyle(fontSize: 16, color: Colors.white),),
          ),
        ),
        title: Text('我要提问'),
        actions: <Widget>[
          InkWell(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.only(right: 10.0),
              height: 36,
              alignment: Alignment.center,
              child:  GestureDetector(
                onTap: () {
                  _dialog(context);
                },
                child: new Text('发布',style: TextStyle( fontSize: 16,color: Colors.white
                  )),
                //shape: CircleBorder(),
                //elevation: 100,
              ),
            ),
          )
        ],
        centerTitle: true,
      ),
      body: TextField(
        minLines: 1,
        maxLines: 25,
        cursorColor: Color.fromARGB(255, 160, 158, 157), //设置光标
        decoration: InputDecoration(

            contentPadding: new EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
            fillColor: Colors.white,
            border: InputBorder.none,
            hintText: '填写提问内容',

            hintStyle: new TextStyle(fontSize: 17, color: Color.fromARGB(255, 160, 158, 157))),
        style: new TextStyle(fontSize: 17, color: Colors.black87),
      ),
    );

  }
  void _dialog(BuildContext context) {
    showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('提示'),

            content: new Text('发布成功，奖励50积分'),
            actions: <Widget>[
              new FlatButton(
                child: new Text('确定'),
                onPressed: () {
          Navigator.pushAndRemoveUntil(context,
          new MaterialPageRoute(builder: (context) => new IndexPage(pageIndex: 1,),),
          (route)=>route==null);
//                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }
}
