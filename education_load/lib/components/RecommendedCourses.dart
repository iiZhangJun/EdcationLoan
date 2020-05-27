import 'package:flutter/material.dart';
import 'package:flutter_yjh/components/CourseDetails.dart';

class RecommendCourses extends StatefulWidget {
  @override
  _RecommendCoursesState createState() => _RecommendCoursesState();
}

class _RecommendCoursesState extends State<RecommendCourses> {

  var course_list=[
    {
      "picture": "images/recommendedCourse5.jpg",
      "name": "Java",
      "institution": "昂立教育",
      "price":10000,
      "location": "成都",
      "starttime":"2019.8.21",
      "endtime":"2019.9.21",
      "teacher":"李华、宋小明",
      "hours":"15课时",
      "phone":"13394058574",
      "introduction":"images/courseIntroduction1.png",
    },
    {
      "picture": "images/recommendedCourse2.jpg",
      "name": "卷积神经网络",
      "institution": "千峰",
      "price":16000,
      "location": "北京",
      "starttime":"2019.8.21",
      "endtime":"2019.9.21",
      "teacher":"李华、宋小明",
      "hours":"15课时",
      "phone":"18739210756",
      "introduction":"images/courseIntroduction1.png",
    },
    {
      "picture": "images/recommendedCourse3.jpg",
      "name": "初级商务英语",
      "institution": "新东方",
      "price":11000,
      "location": "成都",
      "starttime":"2019.8.21",
      "endtime":"2019.9.21",
      "teacher":"李华、宋小明",
      "hours":"15课时",
      "phone":"19247580398",
      "introduction":"images/courseIntroduction1.png",
    },
    {
      "picture": "images/recommendedCourse4.jpg",
      "name": "CFA前导课",
      "institution": "昂立教育",
      "price":8000,
      "location": "成都",
      "starttime":"2019.8.21",
      "endtime":"2019.9.21",
      "teacher":"李华、宋小明",
      "hours":"15课时",
      "phone":"13596084967",
      "introduction":"images/courseIntroduction1.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: course_list.length,
        itemBuilder: (BuildContext context,int index){
          return Course(
            course_location: course_list[index]["location"],
            course_price: course_list[index]["price"],
            course_institution: course_list[index]["institution"],
            course_name: course_list[index]["name"],
            course_teacher: course_list[index]["teacher"],
            course_hour: course_list[index]["hours"],
            course_endtime: course_list[index]["endtime"],
            course_starttime: course_list[index]["starttime"],
            course_picture: course_list[index]["picture"],
            local_phone: course_list[index]["phone"],
            course_introduction: course_list[index]["introduction"],
          );
        },
      ),
    );
  }
}

class Course extends StatelessWidget {

  final course_picture;
  final course_name;
  final course_price;
  final course_institution;
  final course_location;
  final course_starttime;
  final course_endtime;
  final course_teacher;
  final course_hour;
  final local_phone;
  final course_introduction;

  Course({
    this.course_name,
    this.course_price,
    this.course_institution,
    this.course_location,
    this.course_picture,
    this.course_starttime,
    this.course_endtime,
    this.course_teacher,
    this.course_hour,
    this.local_phone,
    this.course_introduction,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
          builder: (context)=> CourseDetails(
            course_detail_name: course_name,
            course_detail_picture: course_picture,
            course_detail_price: course_price,
            course_detail_location: course_location,
            course_detail_institution: course_institution,
            course_detail_starttime: course_starttime,
            course_detail_endtime: course_endtime,
            course_detail_hour: course_hour,
            course_detail_teacher: course_teacher,
            course_detail_introduction: course_introduction,
            local_detail_phone: local_phone,
          ))),
      child: Container(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 0, 10.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
                child: Image.asset(course_picture,fit: BoxFit.cover,width: 120.0,),
              ),
            ),
            Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(course_name),
                    ],),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(course_institution,style: new TextStyle(color: Colors.black26)),
                    ],),
                ),
                Container(
                  width: 220.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("￥"+course_price.toString(),style: new TextStyle(color: Colors.redAccent),),
                      Row(children: <Widget>[
                        Icon(Icons.location_on,size: 15.0,),
                        Text(course_location)
                      ],)
                    ],),
                )
              ],),
          ],),
      ),
    );
  }
}
