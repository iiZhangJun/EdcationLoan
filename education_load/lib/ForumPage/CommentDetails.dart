import 'package:flutter/material.dart';

class CommentDetails extends StatefulWidget {

  final answers;

  CommentDetails({
    this.answers,
  });

  @override
  _CommentDetailsState createState() => _CommentDetailsState();
}

class _CommentDetailsState extends State<CommentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('评论'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            physics: new NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: widget.answers["reviews"].length,
            itemBuilder: (BuildContext context,int index){
              return Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    child: Row(
                      children: <Widget>[
                        ClipOval(
                          child: Image.asset(
                            widget.answers["reviews"][index]["reviewerPicture"], width: 25.0, height: 25.0,),
                        ),
                        Padding(padding: EdgeInsets.all(3.0)),
                        Text(widget.answers["reviews"][index]["reviewerName"], style: new TextStyle(fontSize: 16),)
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(30.0, 0.0, 20.0, 10.0),
                    child: Text(widget.answers["reviews"][index]["reviewContents"], style: new TextStyle(color: Colors.black45),),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 10.0),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(widget.answers["reviews"][index]["reviewTime"], style: new TextStyle(fontSize: 15,color: Colors.black26),),
                          Row(
                            children: <Widget>[
                              Icon(Icons.thumb_up,color: Colors.deepOrange,),
                              Padding(padding: EdgeInsets.all(3.0)),
                              Text('点赞'+"("+widget.answers["reviews"][index]["praisePoints"]+")",style: new TextStyle(color: Colors.black87),)
                            ],
                          )

                        ]),
                  ),
                  Container(height: 1.0,color: Colors.black12),
                ],
              );
            },
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 240,
                child: TextField(
                  cursorColor: Color.fromARGB(255, 160, 158, 157), //设置光标
                  decoration: InputDecoration(
                      contentPadding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: '评论回答',
                      hintStyle: new TextStyle(fontSize: 17, color: Color.fromARGB(255, 160, 158, 157))),
                  style: new TextStyle(fontSize: 17, color: Colors.black87),
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              InkWell(
                onTap: (){},
                child: Icon(Icons.send,color: Colors.black45,),
              )
            ],
          ),
        ),
      ),
    );
  }
}


