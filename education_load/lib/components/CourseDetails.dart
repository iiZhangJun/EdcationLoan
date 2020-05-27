import 'package:flutter/material.dart';
import 'package:flutter_yjh/components/FullPayment.dart';
import 'package:flutter_yjh/components/Installment.dart';
import 'package:flutter_yjh/components/InstitutionDetails.dart';

class CourseDetails extends StatefulWidget {

  final course_detail_picture;
  final course_detail_name;
  final course_detail_price;
  final course_detail_institution;
  final course_detail_location;
  final course_detail_starttime;
  final course_detail_endtime;
  final course_detail_teacher;
  final course_detail_hour;
  final local_detail_phone;
  final course_detail_introduction;

  CourseDetails({
    this.course_detail_price,
    this.course_detail_starttime,
    this.course_detail_endtime,
    this.course_detail_name,
    this.course_detail_picture,
    this.course_detail_location,
    this.course_detail_institution,
    this.course_detail_teacher,
    this.course_detail_hour,
    this.local_detail_phone,
    this.course_detail_introduction,
});

  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(widget.course_detail_name),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.launch, color: Colors.white,size: 22,),
              onPressed: (){}
          ),
        ],
      ),

      body: ListView(
        children: <Widget>[
          ///课程图片
          Container(
            height:170.0,
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Image.asset(widget.course_detail_picture,fit: BoxFit.cover),
          ),
          ///课程信息
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(15.0, 13.0, 15.0, 13.0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 7.0),
                  child: Row(
                    children: <Widget>[
                      Text(widget.course_detail_name,style: new TextStyle(fontSize: 17),),
                      Padding(padding: EdgeInsets.all(3.0)),
                      Text("￥"+widget.course_detail_price.toString(),style: new TextStyle(fontSize: 17,color: Colors.red),),
                    ],),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(2.0, 0.0, 0.0, 2.0),
                  child: Row(
                    children: <Widget>[
                      Text('时间',style: new TextStyle(fontSize: 14,color: Colors.black26),),
                      Padding(padding: EdgeInsets.all(5.0)),
                      Text(widget.course_detail_starttime+'-'+widget.course_detail_endtime,style: new TextStyle(fontSize: 15),),
                      Padding(padding: EdgeInsets.all(3.0)),
                      Text("|",style: new TextStyle(fontSize: 14),),
                      Padding(padding: EdgeInsets.all(3.0)),
                      Text(widget.course_detail_hour,style: new TextStyle(fontSize: 14),),
                    ],),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(2.0, 0.0, 0.0, 2.0),
                  child: Row(
                    children: <Widget>[
                      Text('机构',style: new TextStyle(fontSize: 14,color: Colors.black26),),
                      Padding(padding: EdgeInsets.all(5.0)),
                      Text(widget.course_detail_institution,style: new TextStyle(fontSize: 15),),
                      Padding(padding: EdgeInsets.all(3.0)),
                      Text("|",style: new TextStyle(fontSize: 14),),
                      Padding(padding: EdgeInsets.all(3.0)),
                      Text(widget.course_detail_location,style: new TextStyle(fontSize: 14),),
                    ],),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(2.0, 0.0, 0.0, 2.0),
                  child: Row(
                    children: <Widget>[
                      Text('老师',style: new TextStyle(fontSize: 14,color: Colors.black26),),
                      Padding(padding: EdgeInsets.all(5.0)),
                      Text(widget.course_detail_teacher,style: new TextStyle(fontSize: 14),),
                      Padding(padding: EdgeInsets.all(3.0)),
                    ],),
                ),
              ],
            ),
          ),
          ///课程简介
          Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 13.0,right: 5.0),
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(height: 20.0,width: 5.0,color: Colors.deepOrangeAccent),
                    Padding(padding: EdgeInsets.all(5.0)),
                    Text('课程简介',style: new TextStyle(color: Colors.black87,fontSize: 17),),
                  ],
                ),
                Icon(Icons.chevron_right, color: Colors.black26, size: 22,)
              ],
            ),
          ),
          Container(height: 1.0,color: Colors.black12),
          Container(
            height: 150.0,
            padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
            child: Image.asset(widget.course_detail_introduction,fit: BoxFit.cover),
          ),
          ///课程机构
          Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 13.0,right: 5.0),
            height: 40.0,
            child: InkWell(
              onTap: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(height: 20.0,width: 5.0,color: Colors.deepOrangeAccent),
                      Padding(padding: EdgeInsets.all(5.0)),
                      Text('课程机构',style: new TextStyle(color: Colors.black87,fontSize: 17),),
                    ],
                  ),
                  Icon(Icons.chevron_right, color: Colors.black26, size: 22,)
                ],
              ),
            ),
          ),
          Container(height: 1.0,color: Colors.black12),
        ],
      ),

      ///底部支付栏
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.white,
          height: 58.0,
          padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text('咨询电话',style: new TextStyle(fontSize: 17),),
                      ],),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(widget.local_detail_phone,style: new TextStyle(fontSize: 13,color: Colors.black26),),
                      ],),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context)=>Installment(
                        course_total_price: widget.course_detail_price,
                        unpaid_course_institution: widget.course_detail_institution,
                        unpaid_course_location: widget.course_detail_location,
                        unpaid_course_picture: widget.course_detail_picture,
                        unpaid_course_name: widget.course_detail_name,
                        unpaid_course_endtime: widget.course_detail_endtime,
                        unpaid_course_starttime: widget.course_detail_starttime,
                      ),
                    )),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        color: Colors.deepOrange,
                      ),
                      child: Text('分期支付',style: new TextStyle(color: Colors.white),),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(3.0)),
                  Container(height:30, width: 1.0,color: Colors.black12),
                  Padding(padding: EdgeInsets.all(3.0)),
                  InkWell(
                    onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context)=> FullPayment(
                          unpaid_course_institution: widget.course_detail_institution,
                          unpaid_course_location: widget.course_detail_location,
                          unpaid_course_picture: widget.course_detail_picture,
                          unpaid_course_name: widget.course_detail_name,
                          unpaid_course_price: widget.course_detail_price,
                          unpaid_course_endtime: widget.course_detail_endtime,
                          unpaid_course_starttime: widget.course_detail_starttime,
                        ))),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        color: Colors.deepOrange,
                      ),
                      child: Text('全款支付',style: new TextStyle(color: Colors.white),),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
