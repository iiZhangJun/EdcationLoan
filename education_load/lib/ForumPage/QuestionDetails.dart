import 'package:flutter/material.dart';
import 'CommentDetails.dart';

class QuestionDetails extends StatefulWidget {

  final answers;
  final question_name;
  final questioner_name;
  final questioner_picture;
  final questione_contents;
  final reading_number;
  final answers_number;

  QuestionDetails({
    this.answers,
    this.answers_number,
    this.question_name,
    this.questione_contents,
    this.questioner_name,
    this.questioner_picture,
    this.reading_number,

  });

  @override
  _QuestionDetailsState createState() => _QuestionDetailsState();
}

class _QuestionDetailsState extends State<QuestionDetails> {
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
                  child: Text(widget.question_name,style: new TextStyle(fontSize: 17),),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(widget.answers.length.toString()+"条回答",style: new TextStyle(fontSize: 14,color: Colors.black26),),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(3.0)),
                            color: Colors.deepOrange,
                          ),
                          child: Text('写回答',style: new TextStyle(color: Colors.white),),
                        ),
                      )
                    ],
                  ),
                ),
                Container(height: 1.0,color: Colors.black12),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: new NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: widget.answers.length,
              itemBuilder: (BuildContext context,int index){
                return Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                ClipOval(
                                  child: Image.asset(
                                    widget.answers[index]["answererPicture"], width: 25.0, height: 25.0,),
                                ),
                                Padding(padding: EdgeInsets.all(3.0)),
                                Text(widget.answers[index]["answererName"], style: new TextStyle(fontSize: 16),)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(widget.answers[index]["answerTime"],
                                  style: new TextStyle(fontSize: 15,color: Colors.black26),),
                                Padding(padding: EdgeInsets.all(3.0))
                              ],
                            )
                          ]),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(widget.answers[index]["answerContents"],
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(color: Colors.black45),
                            ),
                          )
                        ],),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      child: InkWell(
                        onTap: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (context) =>
                                    CommentDetails(
                                      answers: widget.answers[index],
                                    ))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.message,color: Colors.deepOrange,),
                                Padding(padding: EdgeInsets.all(3.0)),
                                Text('评论'+"("+widget.answers[index]["reviews"].length.toString()+")",style: new TextStyle(color: Colors.black87),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(height: 1.0,color: Colors.black12),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}