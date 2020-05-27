import 'package:flutter/material.dart';

class ArticleDetails extends StatefulWidget {

  final comments;
  final article_title;
  final author;
  final author_picture;
  final article_contents;
  final reading_number;
  final comments_number;
  final publish_time;

  ArticleDetails({
    this.comments,
    this.reading_number,
    this.article_title,
    this.article_contents,
    this.author,
    this.author_picture,
    this.comments_number,
    this.publish_time,
  });

  @override
  _ArticleDetailsState createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('论坛'),
        centerTitle: true,
      ),

      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(widget.article_title,style: new TextStyle(fontSize: 17),),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                  child: Row(
                    children: <Widget>[
                      Text(widget.publish_time,style: new TextStyle(fontSize: 16,color: Colors.black45),),
                      Padding(padding: EdgeInsets.all(3.0)),
                      Text(widget.author,style: new TextStyle(fontSize: 16,color: Colors.black45),),
                      Padding(padding: EdgeInsets.all(3.0)),
                      Text("阅读数"+ widget.reading_number,style: new TextStyle(fontSize: 16,color: Colors.black45),),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                  child: Text(widget.comments_number+"条评论",style: new TextStyle(fontSize: 14,color: Colors.black26),),
                ),
                Container(height: 1.0,color: Colors.black12),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
            child: Text(widget.article_contents,style: new TextStyle(fontSize: 16,color: Colors.black87),),
          ),
          Container(
            color: Colors.black12,
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: Image.asset(widget.author_picture,width: 30.0,height: 30.0,),
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                Container(
                  width: 240,
                  child: TextField(
                    cursorColor: Color.fromARGB(255, 160, 158, 157), //设置光标
                    decoration: InputDecoration(
                        contentPadding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                        fillColor: Colors.white,
                        filled: true,
                        border: InputBorder.none,
                        hintText: '想对作者说些什么',
                        hintStyle: new TextStyle(fontSize: 17, color: Color.fromARGB(255, 160, 158, 157))),
                    style: new TextStyle(fontSize: 17, color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: new NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: widget.comments.length,
              itemBuilder: (BuildContext context,int index){
                return Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                      child: Row(
                        children: <Widget>[
                          ClipOval(
                            child: Image.asset(widget.comments[index]["reviewerPicture"],width: 30.0,height: 30.0,),
                          ),
                          Padding(padding: EdgeInsets.all(8.0)),
                          Text(widget.comments[index]["reviewer"]+":",style: new TextStyle(fontSize: 16),),
                          Padding(padding: EdgeInsets.all(3.0)),
                          Text(widget.comments[index]["commentsContents"],style: new TextStyle(fontSize: 16),),
                          Padding(padding: EdgeInsets.all(6.0)),
                          Text(widget.comments[index]["commentTime"],style: new TextStyle(fontSize: 16,color: Colors.black26),),
                        ],
                      ),
                  ),
                    Container(height: 1.0,color: Colors.black12),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
