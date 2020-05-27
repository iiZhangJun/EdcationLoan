import 'package:flutter/material.dart';
import 'package:flutter_yjh/components/CourseCategoryDetail.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: ListView(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Categories(
                    name: 'IT培训',
                    icon: Icons.computer,
                    bgcolor: Color.fromARGB(255, 110, 170, 233),
                  ),
                  Categories(
                    name: '职业技能',
                    icon: Icons.build,
                    bgcolor: Color.fromARGB(255, 250, 172, 91),
                  ),
                  Categories(
                    name: '语言',
                    icon: Icons.translate,
                    bgcolor: Color.fromARGB(255, 231, 120, 143),
                  ),
                  Categories(
                    name: '设计',
                    icon: Icons.format_color_fill,
                    bgcolor: Color.fromARGB(255, 221, 107, 107),
                  ),
                  Categories(
                    name: '其他',
                    icon: Icons.more_horiz,
                    bgcolor: Color.fromARGB(255, 72, 204, 194),
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}


class Categories extends StatelessWidget {
  final name;
  final bgcolor;
  final icon;

  Categories({
    this.name,
    this.bgcolor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        decoration: new BoxDecoration(
          color: bgcolor,
          shape: BoxShape.circle,
        ),
        child: IconButton(
            icon: Icon(icon,color: Colors.white,size: 30.0,),
            onPressed: ()=>Navigator.of(context).push(new MaterialPageRoute(
                builder: (context)=>new CourseCategoryDetail(
                  course_category_name:name,
                )))),
      ),
      Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Text(name),
      )
    ],);
  }
}
