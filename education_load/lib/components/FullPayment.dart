import 'package:flutter/material.dart';

import 'CoursePayying.dart';

class FullPayment extends StatefulWidget {

  final unpaid_course_name;
  final unpaid_course_picture;
  final unpaid_course_price;
  final unpaid_course_location;
  final unpaid_course_institution;
  final unpaid_course_starttime;
  final unpaid_course_endtime;

  FullPayment({
    this.unpaid_course_name,
    this.unpaid_course_institution,
    this.unpaid_course_location,
    this.unpaid_course_picture,
    this.unpaid_course_price,
    this.unpaid_course_endtime,
    this.unpaid_course_starttime,
  });

  @override
  _FullPaymentState createState() => _FullPaymentState();
}

class _FullPaymentState extends State<FullPayment> {


  var _select1 = false;
  var _select2 = false;
  var _select3 = false;
  var _icon1 = Icons.radio_button_unchecked;
  var _icon2 = Icons.radio_button_unchecked;
  var _icon3 = Icons.radio_button_unchecked;
  var _activateColor = Colors.black26;
  var _choice = '选择优惠方式';
  var _discount = 0.0;

  Future _openModalBottomSheet() async{
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return Stack(
            children: <Widget>[
              Container(
                height: 25,
                width: double.infinity,
                color: Colors.black54,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                      alignment: Alignment.center,
                      child: Text('选择优惠方式',style: new TextStyle(fontSize: 18),),
                    ),
                    new ListTile(
                      selected: _select1,
                      title: new Text("优惠券"),
                      subtitle: new Text("10元优惠券"),
                      trailing: Icon(_icon1),
                      onTap: () async {
                        Navigator.pop(context,"1");
                      },
                    ),
                    new ListTile(
                      selected: _select2,
                      title: new Text("花旗积分抵扣"),
                      subtitle: new Text("374积分可抵扣3.74元"),
                      trailing: Icon(_icon2),
                      onTap: () async {
                        Navigator.pop(context,"2");
                      },
                    ),
                    new ListTile(
                      selected: _select3,
                      title: new Text("不使用优惠"),
                      trailing: Icon(_icon3),
                      onTap: () async {
                        Navigator.pop(context,"3");
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        }
    );

    switch(option){
      case "1":
        setState(() {
          _choice = "使用优惠券";
          _activateColor = Colors.deepOrangeAccent;
          _discount = 10;
          _select1 = true;
          _select2 = false;
          _select3 = false;
          _icon1 = Icons.check_circle;
          _icon2 = Icons.radio_button_unchecked;
          _icon3 = Icons.radio_button_unchecked;
        });
        break;
      case "2":
        setState(() {
          _choice = "使用积分抵押";
          _activateColor = Colors.deepOrangeAccent;
          _discount = 3.74;
          _select2 = true;
          _select1 = false;
          _select3 = false;
          _icon2 = Icons.check_circle;
          _icon1 = Icons.radio_button_unchecked;
          _icon3 = Icons.radio_button_unchecked;
        });
        break;
      case "3":
        setState(() {
          _choice = "不使用优惠";
          _discount = 0.0;
          _activateColor = Colors.deepOrangeAccent;
          _select3 = true;
          _select2 = false;
          _select1 = false;
          _icon3 = Icons.check_circle;
          _icon2 = Icons.radio_button_unchecked;
          _icon1 = Icons.radio_button_unchecked;
        });
        break;
    }
  }


  void _modalBottomSheetMenu(money){
    showModalBottomSheet(
        context: context,
        builder: (builder){
          return Stack(
            children: <Widget>[
              Container(
                height: 25,
                width: double.infinity,
                color: Colors.black54,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 45.0),
                          alignment: Alignment.center,
                          child: Text('确认付款',style: new TextStyle(fontSize: 18),),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('￥',style: new TextStyle(fontSize: 13),),
                              Text(money.toString(),style: new TextStyle(fontSize: 40),),
                            ],
                          ),
                        ),
                        Container(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('订单信息',style: new TextStyle(fontSize: 16,color: Colors.black26)),
                              Text("课程购买",style: new TextStyle(fontSize: 16))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                          child: Container(height: 1.0,color: Colors.black12),
                        ),
                        Container(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.fromLTRB(20.0, 10.0, 15.0, 10.0),
                          child: InkWell(
                            onTap: (){},
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('付款方式',style: new TextStyle(fontSize: 16,color: Colors.black26)),
                                Row(children: <Widget>[
                                  Text('花旗银行卡',style: new TextStyle(fontSize: 16,color: Colors.black87)),
                                  Icon(Icons.chevron_right,color: Colors.black87),
                                ],)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 65.0),
                          child: Container(height: 1.0,color: Colors.black12),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 200,
                          padding: EdgeInsets.fromLTRB(10.0, 7.0, 10.0, 7.0),
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(3.0)),
                            color: Colors.deepOrange,
                          ),
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
                                builder: (context)=> CoursePayying())),
                            child: Text('立即支付',style: new TextStyle(color: Colors.white,fontSize: 20),),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10.0))
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text('订单确认'),
          centerTitle: true,
        ),

        body: ListView(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                color: Colors.white,
              ),
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 0, 10.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      child: Image.asset(widget.unpaid_course_picture,fit: BoxFit.cover,width: 120.0,),
                    ),
                  ),
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(widget.unpaid_course_name,style: new TextStyle(fontSize: 16),),
                          ],),
                      ),
                      Container(
                        width: 230.0,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(widget.unpaid_course_starttime+'-'+widget.unpaid_course_endtime,style: new TextStyle(fontSize: 13,color: Colors.black26),),
                            Padding(padding: EdgeInsets.all(2.0)),
                            Text("|",style: new TextStyle(fontSize: 13,color: Colors.black26),),
                            Padding(padding: EdgeInsets.all(2.0)),
                            Text(widget.unpaid_course_location,style: new TextStyle(fontSize: 13,color: Colors.black26),),
                          ],),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text("￥"+widget.unpaid_course_price.toString(),style: new TextStyle(fontSize: 16,color: Colors.redAccent),),
                          ],),
                      ),
                    ],),
                ],),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
            Container(height: 1.0,color: Colors.black12),
            Container(
              decoration: new BoxDecoration(
                color: Colors.white,
              ),
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('总价',style: new TextStyle(fontSize: 16)),
                  Text("￥"+widget.unpaid_course_price.toString(),style: new TextStyle(fontSize: 16))
                ],
              ),
            ),
            Container(height: 1.0,color: Colors.black12),
            Container(
              decoration: new BoxDecoration(
                color: Colors.white,
              ),
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 15.0, 10.0),
              child: InkWell(
                ///底部弹出框
                onTap: _openModalBottomSheet,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('优惠方式',style: new TextStyle(fontSize: 16)),
                    Row(children: <Widget>[
                      Text('$_choice',style: new TextStyle(fontSize: 16,color: _activateColor)),
                      Icon(Icons.expand_more,color: Colors.black26),
                    ],)
                  ],
                ),
              ),
            ),
            Container(height: 1.0,color: Colors.black12),
            Container(
              decoration: new BoxDecoration(
                color: Colors.white,
              ),
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('实付款',style: new TextStyle(fontSize: 16)),
                  Text("￥"+(widget.unpaid_course_price-_discount).toString(),style: new TextStyle(fontSize: 16,color: Colors.deepOrange))
                ],
              ),
            ),
            Container(height: 1.0,color: Colors.black12),
          ],
        ),

        bottomNavigationBar: BottomAppBar(
          child: Container(
            color: Colors.white,
            height: 58.0,
            padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('总价: ￥'+(widget.unpaid_course_price-_discount).toString(),style: new TextStyle(fontSize: 16)),
                    Padding(padding: EdgeInsets.all(3.0)),
                    Container(height:30, width: 1.0,color: Colors.black12),
                    Padding(padding: EdgeInsets.all(3.0)),
                    InkWell(
                      onTap:  (){_modalBottomSheetMenu(widget.unpaid_course_price-_discount);},
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(3.0)),
                          color: Colors.deepOrange,
                        ),
                        child: Text('提交订单',style: new TextStyle(color: Colors.white),),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
