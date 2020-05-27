import 'package:flutter/material.dart';
import 'package:flutter_yjh/routes/routes.dart';
import 'package:flutter_yjh/utils/app_size.dart';
import 'package:flutter_yjh/utils/constants.dart';
import 'package:flutter_yjh/view/arc_bg.dart';
import 'package:flutter_yjh/view/custom_view.dart';
import 'package:flutter_yjh/view/theme_ui.dart';
import '../view/theme_ui.dart';

///
/// app 我的页
///
class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage>
    with AutomaticKeepAliveClientMixin {
  List<Widget> contentList;

  @override
  void initState() {
    super.initState();
    print("--*-- _PersonalPageState");
  }

  List<Widget> generateList(BuildContext ctx) {
    if (contentList == null) {
      contentList = new List<Widget>();
      contentList.add(createHeadInfo(ctx));
      contentList.add(createToolBar());
    }
    return contentList;
  }

  createHeadInfo(BuildContext ctx) {
    _generateInfo(String label, String val) {
      return Expanded(
        child: InkWell(
          onTap: () => navigateTo(label),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                val,
                style: ThemeTextStyle.personalNumStyle,
              ),
              Text(label, style: ThemeTextStyle.menuStyle),
            ],
          ),
        ),
      );
    }

    final screenWidth = Screen.width();
    return Container(
        margin: EdgeInsets.only(bottom: AppSize.height(30)),
        height: AppSize.height(900),
        child: Stack(
          children: <Widget>[
            ArcBackground(screenWidth, AppSize.height(500)),
            Container(
              margin: EdgeInsets.only(
                  top: AppSize.height(183),
                  left: AppSize.width(30),
                  right: AppSize.width(30)),
              height: AppSize.height(720),
              decoration: ThemeDecoration.card,
              child: Column(
                children: <Widget>[
                  Expanded(child: Container(decoration: ThemeDecoration.card)),
                  ThemeView.divider(),
                  SizedBox(
                      height: AppSize.height(202),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _generateInfo("账户总额（元）", "0.00"),
                          Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: ThemeView.divider(orient: Orient.vertical),
                          ),
                          _generateInfo("当月待还", "0.00"),
                        ],
                      )),
                  ThemeView.divider(),
                ],
              ),
            ),
            Positioned(
              width: screenWidth,
              top: AppSize.height(110),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  AvatarView(),
                  Text("昵称/账号", style: ThemeTextStyle.primaryStyle),
                  Container(
                    margin: EdgeInsets.only(top: 6, bottom: 25),
                    padding: EdgeInsets.only(left: 8, right: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: Color(0xFFEA3D87))),
                  )
                ],
              ),

//              child: AvatarView(),
            )
          ],
        ));
  }

  createToolBar() {
    var title = <String>["签到","积分兑换" "我的优惠券", "我的积分","我的银行卡", "绑定银行卡", "登录账号"];
    var path = <String>[
      "images/footprint.png",
      "images/head_menu_1.png"
      "images/head_menu_4.png",
      "images/income.png",
      "images/reward.png",
      "images/card_coupon.png",
      "images/sign_out.png",
    ];

    _getImgBtns(int op) {
      int i = op == 0 ? 0 : 4;
      int offset = 4 - i;
      var imageBtns = List<Widget>();
      for (; i < path.length - offset; i++) {
        imageBtns.add(ImageButton(path[i],
            func: navigateTo,
            text: title[i],
            textStyle: ThemeTextStyle.menuStyle2));
      }
      return imageBtns;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        color: ThemeColor.appBg,
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView(
              children: generateList(context),
              physics: ClampingScrollPhysics()),
        ));
  }

  void navigateTo(String lab) {
    switch (lab) {
      case '签到':
      showDialog(
          // 传入 context
          context: context,
          // 构建 Dialog 的视图
          builder: (_) => Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text('今日签到成功！',
                            style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.none)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 8),
                        child: FlatButton(
                            onPressed: () {
                              // 关闭 Dialog
                              Navigator.pop(_);
                            },
                            child: Text('确定')),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
        break;
      case '积分兑换':
        Routes.instance.navigateTo(context, Routes.convert_page);
        break;
      case '我的优惠券':
        Routes.instance.navigateTo(context, Routes.card_vouvher);
        break;
        case '我的银行卡'：
          Routes.instance.navigateTo(context, Routes.card_page);
          break;
      case '我的积分':
        Routes.instance.navigateTo(context, Routes.my_scores);
        break;
      case '绑定银行卡':
        Routes.instance.navigateTo(context, Routes.bandcard);
        break;
      case '登录账号':
        Routes.instance.navigateFromBottom(context, Routes.login_page);
        break;
    }
  }

  @override
  bool get wantKeepAlive => true;
}
