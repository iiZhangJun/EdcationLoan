import 'package:flutter/material.dart';

///搜索控件widget
class TextFileWidget extends StatelessWidget {

  final hint_text;

  TextFileWidget({
    this.hint_text,
  });

  Widget buildTextField() {
    //theme设置局部主题
    return TextField(
      cursorColor: Color.fromARGB(255, 160, 158, 157), //设置光标
      decoration: InputDecoration(

          contentPadding: new EdgeInsets.only(left: 2.0),
          fillColor: Color.fromARGB(255, 255, 216, 207),
          border: InputBorder.none,
          hintText: hint_text,

          hintStyle: new TextStyle(fontSize: 15, color: Color.fromARGB(255, 160, 158, 157))),
      style: new TextStyle(fontSize: 15, color: Colors.black87),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget editView() {
      return Container(
        //修饰背景与圆角
        decoration: new BoxDecoration(
          color: Color.fromARGB(255, 255, 216, 207),
          borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
        ),
        alignment: Alignment.center,
        height: 36,
        width: 270.0,
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
        child: buildTextField(),
      );
    }

    return
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: editView(),
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 2.0,
            ),
          )
        ],
      );
  }
}