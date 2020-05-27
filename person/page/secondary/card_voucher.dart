import 'package:flutter/material.dart';
import 'package:flutter_yjh/utils/app_size.dart';
import 'package:flutter_yjh/view/app_topbar.dart';
import 'package:flutter_yjh/view/customize_appbar.dart';


///
/// 我的卡券页
///
class CardVoucherPage extends StatefulWidget {

  @override
  _CardVoucherPageState createState() => _CardVoucherPageState();
}

class _CardVoucherPageState extends State<CardVoucherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
            preferredSize: Size.fromHeight(AppSize.height(160)),
            child: CommonBackTopBar(title: "我的卡券",
                onBack:()=>Navigator.pop(context))
        ),
        body: Container()
    );
  }
}