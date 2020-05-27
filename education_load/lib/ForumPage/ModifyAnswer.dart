import 'package:flutter/material.dart';
import 'package:flutter_yjh/page/index_page.dart';
import 'package:flutter_yjh/utils/constants.dart';

import 'Forum_page_index.dart';

class ModifyAnswer extends StatefulWidget {
  @override
  _ModifyAnswerState createState() => _ModifyAnswerState();
}

const String title = "码云是什么？";

class _ModifyAnswerState extends State<ModifyAnswer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 36,
              alignment: Alignment.center,
              child: Text(
                '取消',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          title: Text('修改回答'),
          actions: <Widget>[
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.only(right: 10.0),
                height: 36,
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    _dialog(context);
                  },
                  child: new Text('发布',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  //shape: CircleBorder(),
                  //elevation: 100,
                ),
              ),
            )
          ],
          centerTitle: true,
        ),
        resizeToAvoidBottomPadding: false,
        body: new Column(children: <Widget>[
          new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(
                      top: 12.0, bottom: 12.0, left: 8.0, right: 8.0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          bottom: new BorderSide(
                              width: 4.0, color: const Color(0xff999999))
                          // color:const Color(0xff6d9eeb),
                          )),
                  width: Screen.width(),
                  child: new Text(title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w100,
                      )),
                )
              ]),
          new Flexible(
              child: TextField(
            controller: new TextEditingController(
                text:
                    '码云是一个活动票务管理系统，为您方便的创建一个可以在线报名，使用二维码签到的活动，并且针对中小活动免费使用·只需注册网站，发布活动后，将活动报名地址共享给用户即可。'),
            minLines: 1,
            maxLines: 25,
            cursorColor: Color.fromARGB(255, 160, 158, 157),
            //设置光标
            decoration: InputDecoration(
                contentPadding: new EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                fillColor: Colors.white,
                border: InputBorder.none,
                hintText: '填写修改内容',
                hintStyle: new TextStyle(
                    fontSize: 17, color: Color.fromARGB(255, 160, 158, 157))),
            style: new TextStyle(fontSize: 17, color: Colors.black87),
          )),
        ]));
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
                  Navigator.pushAndRemoveUntil(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => new IndexPage(
                          pageIndex: 1,
                        ),
                      ),
                      (route) => route == null);
//                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
