import 'package:flutter/material.dart';
import 'ArticleDetails.dart';
import 'ModifyArticle.dart';
class MyArticle extends StatefulWidget {
  @override
  _MyArticleState createState() => _MyArticleState();
}

class _MyArticleState extends State<MyArticle> {
  var article_list=[
    {
      "articleTitle": "解决Text的overflow属性不生效的问题",
      "author": "smile",
      "authorPicture":"images/avatar1.jpeg",
      "articleContents": "今天学习Flutter的Text组件时，遇到了一个问题：Text的overflow: TextOverflow.ellipsis属性不生效。我想要星标后面的文字在很长的时候，显示为省略号，于是给Text设置了overflow: TextOverflow.ellipsis.Text组件本身是没有宽度的，设置overflow属性的话，必须给它指定宽度，可以通过Expanded设置为铺满，也可以通过Container设置为指定宽度。",
      "readingNumber":"21",
      "commentsNumber":"9",
      "publishTime":"2019/8/16",
      "comments":[{
        "reviewer": "kk",
        "reviewerPicture":"images/avatar2.png",
        "commentsContents":"受教了",
        "commentTime":"2019/8/20",
      },
        {
          "reviewer": "天下布武",
          "reviewerPicture":"images/avatar3.png",
          "commentsContents":"成功解决了",
          "commentTime":"2019/8/22",
        },
      ],
    },
    {
      "articleTitle": "黑马培训一个多月的心得体会",
      "author": "smile",
      "authorPicture":"images/avatar1.jpeg",
      "articleContents": "来黑马一个多月了，觉得自己又像上高中一样，每天早上8点25点名，上到12点吃饭。下午2点到5点。晚自习6点到10点。每天点三次名，还是挺严格的，学习氛围还是很好的。现在网上很多资料，很多免费课程，但是自学能学好的真的是少之又少，所以来培训机构学习是一个不错的选择。这里的同学真的是什么人都有，各种学历，从事过各种行业，不同年龄。有的大学刚毕业就来了，像我这种24岁的算是大龄了。不过同学之间相处还是比较融洽的，都是年轻人，有共同语言",
      "readingNumber":"34",
      "commentsNumber":"6",
      "publishTime":"2019/8/19",
      "comments":[{
        "reviewer": "kk",
        "reviewerPicture":"images/avatar2.png",
        "commentsContents":"受教了",
        "commentTime":"2019/8/20",
      },
        {
          "reviewer": "天下布武",
          "reviewerPicture":"images/avatar3.png",
          "commentsContents":"成功解决了",
          "commentTime":"2019/8/22",
        },
      ],
    },

  ];


  void _dialog(BuildContext context,int index) {
    showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('提示'),
            content: new Text('请选择想要进行的操作'),
            actions: <Widget>[
              new FlatButton(
                child: new Text('修改文章'),
                onPressed: () {
                  ModifyArticlePage();
                },
              ),
              new FlatButton(
                child: new Text('删除文章'),
                onPressed: () {
                  setState(() {
                    article_list.removeAt(index);
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
        title: Text('我的文章'),
        centerTitle: true,
      ),

      body: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: article_list.length,
          itemBuilder: (BuildContext context,int index){
            return InkWell(
              onLongPress: () {
                _dialog(context,index);
              },
              onTap: () =>
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) =>
                          ArticleDetails(
                            article_title: article_list[index]["articleTitle"],
                            publish_time: article_list[index]["publishTime"],
                            article_contents: article_list[index]["articleContents"],
                            author: article_list[index]["author"],
                            author_picture: article_list[index]["authorPicture"],
                            reading_number: article_list[index]["readingNumber"],
                            comments_number: article_list[index]["commentsNumber"],
                            comments: article_list[index]["comments"],
                          ))),
              child: Container(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(article_list[index]["articleTitle"], style: new TextStyle(fontSize: 17),),
                        ],),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(article_list[index]["articleContents"],
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
                                  child: Image.asset(
                                    article_list[index]["authorPicture"], width: 25.0, height: 25.0,),
                                ),
                                Padding(padding: EdgeInsets.all(3.0)),
                                Text(article_list[index]["author"], style: new TextStyle(fontSize: 16),)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("阅读数" +article_list[index]["readingNumber"]+ " | 回答" + article_list[index]["commentsNumber"],
                                  style: new TextStyle(fontSize: 16),),
                                Padding(padding: EdgeInsets.all(3.0))
                              ],
                            )
                          ]),
                    ),
                    Container(height: 1.0, color: Colors.black12),
                  ],),
              ),
            );
          },
        ),
      ),
    );
  }
}



