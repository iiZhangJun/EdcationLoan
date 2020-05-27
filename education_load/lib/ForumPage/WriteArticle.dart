import 'package:flutter/material.dart';
import 'package:flutter_yjh/ForumPage/Forum_page_index.dart';
import 'package:flutter_yjh/page/index_page.dart';

class WriteArticle extends StatefulWidget {
  @override
  _WriteArticleState createState() => _WriteArticleState();
}

class _WriteArticleState extends State<WriteArticle> {
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
        title: Text('写文章'),
        actions: <Widget>[
          InkWell(
            onTap: (){     _dialog(context);},
            child: Container(
              padding: EdgeInsets.only(right: 10.0),
              height: 36,
              alignment: Alignment.centerLeft,
              child: Text('发布',style: TextStyle(fontSize: 16, color: Colors.white),),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 0, 10.0, 0.0),
              child: Text('题目:',style: TextStyle(fontSize: 17, color: Colors.black),),
            ),
            Container(
              width: 240,
              child: TextField(
              cursorColor: Color.fromARGB(255, 160, 158, 157), //设置光标
              decoration: InputDecoration(
                  contentPadding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: '请填写你的文章题目',
                  hintStyle: new TextStyle(fontSize: 17, color: Color.fromARGB(255, 160, 158, 157))),
              style: new TextStyle(fontSize: 17, color: Colors.black87),
            ),
            ),
          ],
        ),
    ),

          Container(height: 4.0,color: Colors.black12),
          TextField(
            minLines: 1,
            maxLines: 25,
            cursorColor: Color.fromARGB(255, 160, 158, 157), //设置光标
            decoration: InputDecoration(

                contentPadding: new EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                fillColor: Colors.white,
                border: InputBorder.none,
                hintText: '填写文章内容',

                hintStyle: new TextStyle(fontSize: 17, color: Color.fromARGB(255, 160, 158, 157))),
            style: new TextStyle(fontSize: 17, color: Colors.black87),
          ),
        ],
      )
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
                },
              ),
            ],
          );
        }
    );
  }
}
