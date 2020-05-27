import 'package:flutter/material.dart';
import 'package:flutter_yjh/components/HomePageSearch.dart';
import 'package:flutter_yjh/components/RecommendedCourses.dart';

class CourseCategoryDetail extends StatefulWidget {

  final course_category_name;

  CourseCategoryDetail({
    this.course_category_name,
  });

  @override
  _CourseCategoryDetailState createState() => _CourseCategoryDetailState();
}

class _CourseCategoryDetailState extends State<CourseCategoryDetail> {

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
      "picture": "images/recommendedCourse8.jpg",
      "name": "SpringMVC拦截器",
      "institution": "昂立教育",
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
      "picture": "images/recommendedCourse6.jpg",
      "name": "SpringBoot深度实践",
      "institution": "昂立教育",
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
      "picture": "images/recommendedCourse7.jpg",
      "name": "Hibernate缓存策略",
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
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        ///顶部搜索框
        title: TextFileWidget(hint_text: '搜索更多'+ widget.course_category_name+'课程',),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search, color: Colors.white,),
              onPressed: (){}
          ),
        ],
        centerTitle: true,
      ),


      body: Container(
        padding: EdgeInsets.only(top: 10.0),
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
      ),
    );
  }
}
