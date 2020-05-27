import 'package:flutter/material.dart';
import 'package:flutter_yjh/components/CourseCategoryDetail.dart';

class InstitutionDetails extends StatefulWidget {

  final institution_name;
  final institution_course;
  final institution_picture;
  final institution_address;
  final institution_detailPhotos;
  final institution_introduction;
  final institution_phone;

  InstitutionDetails({
    this.institution_introduction,
    this.institution_detailPhotos,
    this.institution_address,
    this.institution_picture,
    this.institution_name,
    this.institution_course,
    this.institution_phone
});
  @override
  _InstitutionDetailsState createState() => _InstitutionDetailsState();
}

class _InstitutionDetailsState extends State<InstitutionDetails> {

  List<Widget> _buildNames(int length){
    return List.generate(length, (int index){
      return SingleCourse(
        course_category_name: widget.institution_course[index],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: new AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(widget.institution_name),
        centerTitle: true,
        ),

        body: CustomScrollView(
          ///机构图片
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 170.0,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(widget.institution_picture,fit: BoxFit.cover),
              ),
            ),
            ///tab
            SliverPadding(padding: EdgeInsets.all(1.0)),
            new SliverToBoxAdapter(
              child: Material(
                //这里设置tab的背景色
                color: Colors.white,
                child: new TabBar(
                  indicatorColor: Colors.deepOrange,
                  unselectedLabelColor: Color.fromARGB(255, 160, 158, 157),
                  labelColor: Colors.deepOrange,
                  tabs: <Widget>[
                    Tab(text: '机构介绍',),
                    Tab(text: '机构课程',),
                  ],
              ),),
            ),
          new SliverFillRemaining(
            child: TabBarView(
              children: <Widget>[
                ///机构介绍内容
                ListView(
                  children: <Widget>[
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
                              Text('照片',style: new TextStyle(color: Colors.black87,fontSize: 17),),
                              Padding(padding: EdgeInsets.all(2.0)),
                              Text('('+widget.institution_detailPhotos.length.toString()+'张)',style: new TextStyle(color: Colors.black26,fontSize: 17),),
                            ],
                          ),
                          Icon(Icons.chevron_right, color: Colors.black26, size: 22,)
                        ],
                      ),
                    ),
                    Container(height: 1.0,color: Colors.black12),
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 5.0),
                      color: Colors.white,
                      height: 100.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.institution_detailPhotos.length,
                        itemBuilder: (BuildContext context,int index){
                          return SinglePhoto(
                            image_location: widget.institution_detailPhotos[index],
                          );
                        },
                      ),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(left: 13.0,right: 5.0),
                      height: 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.account_balance, color: Colors.deepOrangeAccent, size: 22,),
                              Padding(padding: EdgeInsets.all(5.0)),
                              Text(widget.institution_address,style: new TextStyle(color: Color.fromARGB(255, 160, 158, 157)),),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.phone, color: Colors.deepOrangeAccent, size: 22,),
                              Padding(padding: EdgeInsets.all(5.0)),
                              Text(widget.institution_phone,style: new TextStyle(color: Color.fromARGB(255, 160, 158, 157)),),
                            ],
                          ),
                        ],
                      ),
                    ),
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
                              Text('机构简介',style: new TextStyle(color: Colors.black87,fontSize: 17),),
                            ],
                          ),
                          Icon(Icons.chevron_right, color: Colors.black26, size: 22,)
                        ],
                      ),
                    ),
                    Container(height: 1.0,color: Colors.black12),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 15.0, 15.0),
                      color: Colors.white,
                      child: Text(widget.institution_introduction,style: new TextStyle(color: Color.fromARGB(255, 160, 158, 157),height: 1.2),),
                    ),
                  ],
          ),
                ///机构课程内容
                ListView(
                    shrinkWrap:true,
                  children: <Widget>[
                    new GridView.count(
                      padding: EdgeInsets.fromLTRB(40.0, 25.0, 40.0, 10.0),
                      physics: new NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisSpacing: 60.0,
                      mainAxisSpacing: 20.0,
                      crossAxisCount: 2,
                      childAspectRatio: 2.5,
                      children: _buildNames(widget.institution_course.length),
                    )],
                ),
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}

class SinglePhoto extends StatelessWidget {

  final image_location;

  SinglePhoto({
    this.image_location,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 0.0, 10.0),
        child: InkWell(
          onTap: (){},
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            child: Image.asset(image_location,fit: BoxFit.cover,height: 80.0,),
          ),
        )
    );
  }
}


class SingleCourse extends StatelessWidget {

  final course_category_name;

  SingleCourse({
    this.course_category_name,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
          builder: (context)=>new CourseCategoryDetail(
              course_category_name:course_category_name))),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          color: Colors.deepOrangeAccent,
        ),
        child: Text(course_category_name,style: new TextStyle(color: Colors.white),),
      ),
    );
  }
}
