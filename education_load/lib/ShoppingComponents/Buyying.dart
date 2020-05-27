import 'package:flutter/material.dart';
import 'package:flutter_yjh/ShoppingComponents/Payying.dart';


class Buyying extends StatelessWidget {
  String briefIntro;
  var money;
  String imageUrl;
  var freight;

  Buyying({Key key,@required this.briefIntro,@required this.money,@required this.imageUrl,@required this.freight}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //var totalMoney=(int)('${money}'+'${freight}');
    return Scaffold(
        appBar: AppBar(
            title: Text('购买宝贝'),
            centerTitle: true,
            backgroundColor: Colors.deepOrangeAccent
        ),
        body: Stack(
          children: <Widget>[
            Container(color: Colors.black12,),
            Column(
              children: <Widget>[
                Expanded(
                    flex:6,
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(flex:1,child: Image.network('${imageUrl}'),),
                          Expanded(flex:3,child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text('${briefIntro}',style: TextStyle(fontSize: 20),),
                              Text('￥'+'${money}',style: TextStyle(fontSize: 20,color: Colors.deepOrangeAccent),)
                            ],
                          ),)
                        ],
                      ),
                    )
                ),
                Container(padding: EdgeInsets.only(bottom: 13),),
                Expanded(
                  flex:3,
                  child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(left: 15,right: 15),
                      child: Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('收货地址',style:TextStyle(fontSize: 20)),
                            Row(
                              children: <Widget>[
                                Text('从数据库获取地址信息'),
                                IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: null),
                              ],
                            )
                          ],),
                      )
                  ),
                ),
                Container(padding: EdgeInsets.only(bottom: 4),),
                Expanded(
                  flex: 2,
                  child:Container(
                    color: Colors.white,
                    padding:EdgeInsets.only(left: 15,right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text('运费',style: TextStyle(fontSize: 20),),
                        Text('￥'+ '${freight}',style: TextStyle(fontSize: 20,color: Colors.deepOrangeAccent),)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 15,
                  child: Container(),
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.white,
                      padding:EdgeInsets.only(left: 15,right: 15),
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('实付款：￥'+'55',style: TextStyle(fontSize: 20),),
                            RaisedButton(
                              child: new Text('确定'),
                              color: Colors.deepOrangeAccent,
                              onPressed: (){_modalBottomSheetMenu(context);},
                              textColor: Colors.white,
                            ),]
                      ),
                    )),
                Container(padding: EdgeInsets.only(bottom: 4),),
              ],
            )
          ],
        )
    );
  }

  void _modalBottomSheetMenu(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (builder){
          return new Container(
            height: 300.0,
            color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Container()
                    //IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: null,),
                  ),
                  Expanded(flex: 1,child: Text('￥'+'55',style: TextStyle(fontSize: 25,color: Colors.black87),),),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('花旗账号',style: TextStyle(fontSize: 17,color: Colors.black54),),
                        Text('从数据库获取账号名',style: TextStyle(fontSize: 17,color: Colors.black54),)
                      ],
                    ) ,
                  ),
                  Divider(height: 5,color: Colors.black,),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('付款方式',style: TextStyle(fontSize: 17,color: Colors.black54),),
                        Text('花旗银行储蓄卡（0020）',style: TextStyle(fontSize: 17,color: Colors.black54),)
                      ],
                    ) ,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                  Expanded(
                      flex:1,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: RaisedButton(
                              child: new Text('立即支付'),
                              color: Colors.deepOrangeAccent,
                              onPressed: (){
                                //new _modalBottomSheetPay(context);
                                Navigator.push(
                                  context,
                                  new MaterialPageRoute(builder: (context) => new Payying()),
                                );
                              },
                              textColor: Colors.white,
                            ),
                          )
                        ],
                      )
                  )
                ],
              ),
            ),
          );
        }
    );
  }

}