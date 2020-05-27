import 'package:flutter/material.dart';
import 'package:flutter_yjh/utils/app_size.dart';
import 'package:flutter_yjh/view/app_topbar.dart';
import 'package:flutter_yjh/view/customize_appbar.dart';

import '../index_page.dart';

class ExchangePage extends StatefulWidget {
  @override
  _ExchangePageState createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  var _isHuaQi;
  var _isQuan;
  var _platPonit1;
  var _platPonit2;
  var _finishedHuaQi;
  var _finishedMoney = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _finishedHuaQi = '相应的兑换值';
    _finishedMoney.text= '相应的兑换值';
    _finishedMoney.addListener((){
      print(_finishedMoney.text);
    });
    _isHuaQi = true;
    _isQuan = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          preferredSize: Size.fromHeight(AppSize.height(160)),
          child: CommonBackTopBar(
              title: "兑换积分", onBack: () => Navigator.pop(context))),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 100),
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        textBaseline: TextBaseline.ideographic,
                        children: <Widget>[
                          Checkbox(
                            value: _isHuaQi,
                            onChanged: (v) {
                              setState(() {
                                this._isHuaQi = v;
                                if(_isHuaQi == true){
                                  this._isQuan  = false;
                                }
                              });
                            },

                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              '兑换花旗点',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: 2, color: Color.fromRGBO(238, 238, 238, 1)),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Text(
                              "10个平台积分可兑换一个花旗点",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: 2, color: Color.fromRGBO(238, 238, 238, 1)),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 200,
                                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  child: Text(
                                    '可兑换的平台积分：',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  width: 150,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets
                                          .symmetric(vertical: 5.0),
                                      hintText: "最少填100个",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                    ),
                                    onChanged: (v){
                                      setState(() {
                                        this._platPonit1 = v;
                                        this._finishedHuaQi = (int.parse(v)/10).toString();
                                      });
                                    },
                                  ),
                                ),
                              ],),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 200,
                                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  child: Text(
                                    '花旗点：',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  alignment: Alignment.centerRight,
                                  width: 150,
                                  child: Text("${this._finishedHuaQi}", style: TextStyle(fontSize: 20),),
                                ),
                              ],),
                          ),
                        ],
                      ),
                    ),
                  ],),
              ),
              Container(height: 10, color: Color.fromRGBO(238, 238, 238, 0.9)),
              Container(
                height: 200,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Checkbox(
                            value: _isQuan,
                            onChanged: (v) {
                              setState(() {
                                this._isQuan = v;
                                if(_isQuan == true){
                                  _isHuaQi=false;
                                }
                              });
                            },

                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              '兑换减免券',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Text(
                              "10个平台积分可兑换1元",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 200,
                                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  child: Text(
                                    '可兑换的平台积分：',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  width: 150,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets
                                          .symmetric(vertical: 5.0),
                                      hintText: "最少填100个",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                    ),
                                    onChanged: (v) {
                                      setState(() {
                                        this._platPonit2 = v;
                                        this._finishedMoney.text = (int.parse(_platPonit2)*0.1).toString();
                                      });
                                    },
                                  ),
                                ),
                              ],),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 200,
                                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  child: Text(
                                    '兑换金额：',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  alignment: Alignment.centerRight,
                                  width: 150,
                                  child: TextField(
                                    controller: this._finishedMoney,
                                    enabled: false,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets
                                          .symmetric(vertical: 5.0),
                                      hintText: "相应的兑换值",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                              ],),
                          ),
                        ],
                      ),
                    ),
                  ],),
              ),
              SizedBox(height: 70,),
              Container(
                height: 50,
                width: 200,
                child: RaisedButton(
                  child: Text(
                    "确认兑换",
                    style: TextStyle(
                      fontSize: 20,
                    ),),
                  onPressed: () {
                    if (_isHuaQi == true && _platPonit1 != null) {
                      showAlertDialog1(context);
                    }

                    if (_isQuan == true && _platPonit2 != null) {
                      showAlertDialog2(context);
                    }
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showAlertDialog1(BuildContext context) {
    NavigatorState navigator = context.rootAncestorStateOfType(
        const TypeMatcher<NavigatorState>());
    debugPrint("navigator is null?" + (navigator == null).toString());
    showDialog(
        context: context,
        builder: (_) =>
        new AlertDialog(
            title: new Text("提示"),
            content: new Text("兑换花旗点成功！"),
            actions: <Widget>[
              new FlatButton(child: new Text("OK"), onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => new IndexPage(
                        pageIndex: 4,
                      ),
                    ),
                        (route) => route == null);
              },)
            ]
        ));
  }

  void showAlertDialog2(BuildContext context) {
    NavigatorState navigator = context.rootAncestorStateOfType(
        const TypeMatcher<NavigatorState>());
    debugPrint("navigator is null?" + (navigator == null).toString());
    showDialog(
        context: context,
        builder: (_) =>
        new AlertDialog(
            title: new Text("提示"),
            content: new Text("兑换减免券成功！"),
            actions: <Widget>[
              new FlatButton(child: new Text("OK"), onPressed: () {
                Navigator.of(context).pop();
              },)
            ]
        ));
  }
}
