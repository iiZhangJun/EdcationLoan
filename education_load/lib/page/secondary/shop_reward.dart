import 'package:flutter/material.dart';
import 'package:flutter_yjh/utils/app_size.dart';
import 'package:flutter_yjh/utils/constants.dart';
import 'package:flutter_yjh/view/app_topbar.dart';
import 'package:flutter_yjh/view/arc_bg.dart';
import 'package:flutter_yjh/view/customize_appbar.dart';
import 'package:flutter_yjh/view/flutter_iconfont.dart';
import 'package:flutter_yjh/view/theme_ui.dart';

///
/// 门店奖励页
///
class ShopRewardPage extends StatefulWidget {
  @override
  _ShopRewardPageState createState() => _ShopRewardPageState();
}

class _ShopRewardPageState extends State<ShopRewardPage> {
  TextEditingController _phoneNum = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          preferredSize: Size.fromHeight(AppSize.height(160)),
        child:
         CommonBackTopBar(
             title: "绑定银行卡", onBack: () => Navigator.pop(context))
      ),
      body: Container(
        color: ThemeColor.appBg,
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
//                ArcBackground(Screen.width(), AppSize.height(800)),
                Container(
                  margin: EdgeInsets.only(
                      top: AppSize.height(380),
                      left: AppSize.width(30),
                      right: AppSize.width(30),
                      bottom: AppSize.height(120)),
                  padding: EdgeInsets.only(
                      top: AppSize.height(300),
                      right: AppSize.width(60),
                      left: AppSize.width(60)),
                  decoration: ThemeDecoration.card,
                  child: Column(
                    children: <Widget>[
                      TextField(
                        keyboardType: TextInputType.phone,
                        controller: _phoneNum,
                        maxLines: 1,
                        maxLength: 30,
                        decoration: InputDecoration(
                            hintText: "请输入银行卡号",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: AppSize.height(30))),
                      ),
                      TextField(
                        keyboardType: TextInputType.phone,
                        controller: _phoneNum,
                        maxLines: 1,
                        maxLength: 30,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone_iphone),
                            hintText: "请输入手机号码",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: AppSize.height(30))),
                      ),
                      TextField(
                        controller: _password,
                        maxLines: 1,
                        maxLength: 6,
                        obscureText: true,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "请输入短信验证码",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: AppSize.height(30)),
                            suffixIcon: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: AppSize.height(30)),
                              child: Text(
                                '获取验证码',
                                style: TextStyle(
                                    fontSize: AppSize.sp(40),
                                    color: ThemeColor.appBarTopBg),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: Screen.statusH() + AppSize.height(30),
                  left: AppSize.width(30),
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        IconFonts.arrow_left,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
