import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_yjh/components/CategoryNavigation.dart';
import 'package:flutter_yjh/components/RecommendedCourses.dart';
import 'package:flutter_yjh/components/RecommendInstitutions.dart';
import 'package:flutter_yjh/components/CitySelect/CitySelect.dart';
import 'package:flutter/cupertino.dart';


class CoursePage extends StatefulWidget {

  var location = "成都市";

  @override
  _CoursePageState createState() => _CoursePageState();
}


class _CoursePageState extends State<CoursePage> {

  @override
  ///广告轮播
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 150.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/advertisement1.jpg'),
          AssetImage('images/advertisement2.jpg'),
          AssetImage('images/advertisement3.jpeg'),
          AssetImage('images/advertisement4.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 3.0,
        indicatorBgPadding: 2.0,
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: InkWell(
                onTap: () async {
                  final result =await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CitySelect(
                      selectCity: widget.location,
                    )),
                  );
                  setState(() {
                    widget.location = result;
                  });
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.location_on,size: 20.0,color:Colors.white ,),
                    Text(widget.location,style: new TextStyle(color: Colors.white),)
                  ],
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),

      body: new ListView(
        children: <Widget>[
          image_carousel,
          ///类别导航栏
          CategoryList(),
          ///分割线
          Container(height: 4.0,color: Colors.black12),
          ///机构推荐
          Container(
            padding: EdgeInsets.only(left: 13.0,right: 5.0),
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('推荐机构',style: new TextStyle(fontSize: 17),),
                Row(children: <Widget>[
                  Text('换一换',style: new TextStyle(fontSize: 17,color: Colors.black26),),
                  IconButton(icon: Icon(Icons.loop, color: Colors.black26, size: 22,), onPressed: (){})
                ],),
              ],
            ),
          ),
          RecommendInstitutions(),
          ///分割线
          Container(height: 4.0,color: Colors.black12),
          ///课程推荐
          Container(
            padding: EdgeInsets.only(left: 13.0,right: 5.0),
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('推荐课程',style: new TextStyle(fontSize: 17),),
                Row(children: <Widget>[
                  Text('换一换',style: new TextStyle(fontSize: 17,color: Colors.black26),),
                  IconButton(icon: Icon(Icons.loop, color: Colors.black26, size: 22,), onPressed: (){})
                ],),
              ],
            ),
          ),
          RecommendCourses(),
        ],
      ),
    );
  }
}




  

