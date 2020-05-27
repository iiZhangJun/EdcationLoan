import 'package:flutter/material.dart';



class WriteAnswer extends StatefulWidget{
  String title;
  WriteAnswer({this.title});
  @override
  createState() => new WriteAnswerState();
}

class WriteAnswerState extends State<WriteAnswer>{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar://new AppBar(title:new Text(''),),
      new AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        leading: Container(
          alignment: Alignment.center,
          child: FlatButton(
            child: new Text('取消',style: TextStyle(fontSize: 12,color: Colors.white),),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title:Text('写回答',style: TextStyle(fontSize: 19,color: Colors.white),),
        actions: <Widget>[
          FlatButton(
            child: new Text('发布',style: TextStyle(fontSize: 12,color: Colors.white),),
            onPressed: () {
              _dialog(context);
            },
          ),
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child:Text(widget.title,style: TextStyle(fontSize: 20,),),
          ),
          Container(
            height: 5,
            color: Colors.black12,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              autofocus: false,
              maxLines: 20,
              decoration: InputDecoration(
                  hintText: '填写回答内容',
                  border: InputBorder.none
              ),
            ),
          )
        ],
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
  void _dialog(BuildContext context) {
    showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('提示'),

            content: new Text('发布成功，奖励10积分'),
            actions: <Widget>[
              new FlatButton(
                child: new Text('确定'),
                onPressed: () {
                  Navigator.pushNamed(context, '/QA');
                },
              ),
            ],
          );
        }
    );
  }
}