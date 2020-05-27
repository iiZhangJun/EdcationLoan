import 'package:flutter/material.dart';
import 'package:flutter_yjh/ForumPage/AskQuestion.dart';
import 'package:flutter_yjh/ForumPage/WriteArticle.dart';
import 'package:flutter_yjh/ForumPage/MyArticle.dart';

import 'MyQuestion.dart';
import 'answer.dart';
import 'article.dart';
//import 'SidebarPage.dart';

class ForumPage extends StatefulWidget {
  ForumPage({Key key}) : super(key: key);


  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {

  SelectView(IconData icon, String text, String id, Jumppages) {
    return new PopupMenuItem<String>(
        value: id,
        child: InkWell(
        onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
        builder: (context)=>Jumppages)),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Icon(icon, color: Colors.deepOrangeAccent),
          new Text(text),
        ],
      ),
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('起航论坛'),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
          leading: IconButton(
            //查询设置
            icon: new Icon(Icons.search),
            tooltip: '搜索',
            onPressed: () {
              //实现论坛或帖子的相关搜索功能
            },
          ),
          actions: <Widget>[
            // 隐藏的菜单(包含发布文章，消息等)
            new PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                this.SelectView(Icons.border_color, '我要提问', 'A',new AskQuestion()),
                this.SelectView(Icons.add, '发布文章', 'B',new WriteArticle()),
                this.SelectView(Icons.assignment_ind, '我的提问', 'C',new MyQuestion()),
                this.SelectView(Icons.account_box,'我的文章','D',new MyArticle())
              ],
              onSelected: (String action) {
                // 点击选项的时候
                switch (action){
                  case 'A':break;//消息提醒widget
                  case 'B': break;//发布帖子widget
                  case 'C': break;//我的帖子widget
                  case 'D': break;//我的文章widget
                }
              },
            ),
          ],
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              new Image.network('https://mmbiz.qpic.cn/mmbiz_png/2tfYMRGLH9PVI82qjpKicIJbBeVYj09hibNEpC4ODnaw7tecrf4ibH33OicMuYbCZSs2RAq3voUDwvxfPGpfxu3NAg/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1'),
              Container(
                color: Colors.deepOrangeAccent,
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  labelPadding: EdgeInsets.only(left: 20),
                  indicatorWeight: 1,
                  isScrollable: false,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TextStyle(fontSize: 15),
                  tabs: <Widget>[
                    Tab(text: '知识问答'),
                    Tab(text: '文章'),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: TabBarView(
                  children: <Widget>[
                    answer(),
                    article(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}






