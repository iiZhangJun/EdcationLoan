import 'package:flutter/material.dart';
import 'package:flutter_yjh/components/InstitutionDetails.dart';

class RecommendInstitutions extends StatefulWidget {
  @override
  _RecommendInstitutionsState createState() => _RecommendInstitutionsState();
}

class _RecommendInstitutionsState extends State<RecommendInstitutions> {

  var institution_list = [
    {
      "name": "昂立教育",
      "picture": "images/recommendInstitution1.jpg",
      "address":"成都市锦江区",
      "phone":"13398468739",
      "introduction":"“上海昂立教育培训有限公司”始于1984年，源自上海交通大学，经三十余年精耕，成就了教育培训行业中驰名的“昂立教育”品牌。教育产品涵盖幼儿园、小学、中学生等全科目课外辅导，更有素质类产品（琴棋书画、科技创新、体育、游学等）全面助力K12学生群体卓著成长。以创新的产品、优质的教学、周到的服务，满足国人追求卓越教育的渴望。如今，昂立教育重点关注中国基础教育发展，聚焦K12领域，致力于成为青少儿教育成长专家。 目前拥有近5000名正式员工，2000余位全职教师，拥有完备的教研与服务体系。2014年，昂立教育通过资产重组，整体注入上市公司,迎来全新的发展机遇。",
      "detailPhotos":[ "images/institutionPhoto1.jpg", "images/institutionPhoto2.jpg", "images/institutionPhoto3.jpg", "images/institutionPhoto4.jpg", ],
      "course": [ "Java", "软件测试", "PHP", "python", ".NET", "web前端",],
    },
    {
      "name": "恩博教育",
      "picture": "images/recommendInstitution2.jpg",
      "address":"成都市金牛区",
      "phone":"18698468739",
      "introduction":"“上海昂立教育培训有限公司”始于1984年，源自上海交通大学，经三十余年精耕，成就了教育培训行业中驰名的“昂立教育”品牌。教育产品涵盖幼儿园、小学、中学生等全科目课外辅导，更有素质类产品（琴棋书画、科技创新、体育、游学等）全面助力K12学生群体卓著成长。以创新的产品、优质的教学、周到的服务，满足国人追求卓越教育的渴望。如今，昂立教育重点关注中国基础教育发展，聚焦K12领域，致力于成为青少儿教育成长专家。 目前拥有近5000名正式员工，2000余位全职教师，拥有完备的教研与服务体系。2014年，昂立教育通过资产重组，整体注入上市公司,迎来全新的发展机遇。",
      "detailPhotos":[ "images/recommendInstitution1.jpg", "images/recommendInstitution1.jpg", "images/recommendInstitution1.jpg", "images/recommendInstitution1.jpg", ],
      "course": [ "Java", "软件测试", "PHP", "python", ".NET", "web前端",],
    },
    {
      "name": "襄建教育",
      "picture": "images/recommendInstitution3.jpg",
      "address":"成都市高新区",
      "phone":"18748468739",
      "introduction":"“上海昂立教育培训有限公司”始于1984年，源自上海交通大学，经三十余年精耕，成就了教育培训行业中驰名的“昂立教育”品牌。教育产品涵盖幼儿园、小学、中学生等全科目课外辅导，更有素质类产品（琴棋书画、科技创新、体育、游学等）全面助力K12学生群体卓著成长。以创新的产品、优质的教学、周到的服务，满足国人追求卓越教育的渴望。如今，昂立教育重点关注中国基础教育发展，聚焦K12领域，致力于成为青少儿教育成长专家。 目前拥有近5000名正式员工，2000余位全职教师，拥有完备的教研与服务体系。2014年，昂立教育通过资产重组，整体注入上市公司,迎来全新的发展机遇。",
      "detailPhotos":[ "images/recommendInstitution1.jpg", "images/recommendInstitution1.jpg", "images/recommendInstitution1.jpg", "images/recommendInstitution1.jpg", ],
      "course": [ "Java", "软件测试", "PHP", "python", ".NET", "web前端",],
    },
    {
      "name": "高思教育",
      "address":"成都市青阳区",
      "picture": "images/recommendInstitution4.jpg",
      "phone":"13494846873",
      "introduction":"“上海昂立教育培训有限公司”始于1984年，源自上海交通大学，经三十余年精耕，成就了教育培训行业中驰名的“昂立教育”品牌。教育产品涵盖幼儿园、小学、中学生等全科目课外辅导，更有素质类产品（琴棋书画、科技创新、体育、游学等）全面助力K12学生群体卓著成长。以创新的产品、优质的教学、周到的服务，满足国人追求卓越教育的渴望。如今，昂立教育重点关注中国基础教育发展，聚焦K12领域，致力于成为青少儿教育成长专家。 目前拥有近5000名正式员工，2000余位全职教师，拥有完备的教研与服务体系。2014年，昂立教育通过资产重组，整体注入上市公司,迎来全新的发展机遇。",
      "detailPhotos":[ "images/recommendInstitution1.jpg", "images/recommendInstitution1.jpg", "images/recommendInstitution1.jpg", "images/recommendInstitution1.jpg", ],
      "course": [ "Java", "软件测试", "PHP", "python", ".NET", "web前端",],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child:ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: institution_list.length,
        itemBuilder: (BuildContext context,int index){
          return SingleInstitution(
            institution_name: institution_list[index]["name"],
            institution_course: institution_list[index]["course"],
            institution_picture: institution_list[index]["picture"],
            institution_address: institution_list[index]["address"],
            institution_detailPhotos: institution_list[index]["detailPhotos"],
            institution_introduction: institution_list[index]["introduction"],
            institution_phone: institution_list[index]["phone"],
          );
        },
      ),
    );
  }
}

class SingleInstitution extends StatelessWidget {

  final institution_name;
  final institution_picture;
  final institution_course;
  final institution_address;
  final institution_introduction;
  final institution_detailPhotos;
  final institution_phone;

  SingleInstitution({
    this.institution_course,
    this.institution_name,
    this.institution_picture,
    this.institution_address,
    this.institution_detailPhotos,
    this.institution_introduction,
    this.institution_phone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 10.0),
        child: InkWell(
          onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
              builder: (context)=>new InstitutionDetails(
                institution_introduction: institution_introduction,
                institution_detailPhotos: institution_detailPhotos,
                institution_address: institution_address,
                institution_picture: institution_picture,
                institution_course: institution_course,
                institution_name: institution_name,
                institution_phone: institution_phone,
              )
          )),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            child: Image.asset(institution_picture,fit: BoxFit.cover,height: 80.0,),
          ),
        )
    );
  }
}

