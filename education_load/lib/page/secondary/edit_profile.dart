import 'package:flutter/material.dart';
import 'package:flutter_yjh/utils/app_size.dart';
import 'package:flutter_yjh/view/app_topbar.dart';
import 'package:flutter_yjh/view/customize_appbar.dart';
import 'package:flutter_yjh/page/secondary/exchange_page.dart';

///
/// 完善资料页
///
class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
            preferredSize: Size.fromHeight(AppSize.height(160)),
            child: CommonBackTopBar(
                title: "兑换积分", onBack: () => Navigator.pop(context))),
        body: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 500,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        width: 250,
                        height: 70,
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Text('满1000减100',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                        decoration: BoxDecoration(
                          border:Border.all(color: Color(0XFF302F4F),width: 2),
                        ),
                      ),
                      Container(
                        width: 250,
                        height: 70,
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Text('满5000减600',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                        decoration: BoxDecoration(
                          border:Border.all(color: Color(0XFF302F4F),width: 2),
                        ),
                      ),
                      Container(
                        width: 250,
                        height: 70,
                        padding: EdgeInsets.all(20),
                        child: Text('满1000减100',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                        decoration: BoxDecoration(
                          border:Border.all(color: Color(0XFF302F4F),width: 2),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 200,
                  child: RaisedButton(
                    child:Text(
                      "积分兑换",
                      style: TextStyle(
                        fontSize: 20,
                      ),),
                    onPressed:(){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder:(BuildContext context){
                                return ExchangePage();
                              }
                          )
                      );
                    },
                    color:Colors.blue,
                    textColor:Colors.white,
                  ),
                ),
              ],
            )
        ),);
  }
}
