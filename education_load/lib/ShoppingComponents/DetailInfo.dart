import 'package:flutter/material.dart';
import 'package:flutter_yjh/ShoppingComponents/Buyying.dart';
import '../components/ChatBoard.dart';

class DetailInfo extends StatelessWidget {
  String imageUrl;
  var money;
  String briefIntro;
  String address;
  String dpUrl;
  var freight;

  DetailInfo({Key key,@required this.imageUrl,@required this.money,@required this.briefIntro,@required this.address,
    @required this.dpUrl,@required this.freight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('二手商城'),
            centerTitle: true,
            backgroundColor: Colors.deepOrangeAccent
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex:4,
                child: Stack(
                  children: <Widget>[
                    Container(
                      color: Colors.black,
                    ),
                    Container(
                      alignment:AlignmentDirectional.center,
                      //color: Colors.black,
                      child: Image.network('${imageUrl}',fit: BoxFit.contain,),
                    )
                  ],
                )
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: new Text('￥'+'${money}',style:TextStyle(
                        fontSize: 30,
                        color: Colors.deepOrangeAccent
                    )),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: new Text('${briefIntro}',style: TextStyle(
                          fontSize: 20,color: Colors.black54
                      ),)
                  ),
                  Container(padding: EdgeInsets.fromLTRB(0, 10, 0, 17),),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 4, 15, 3),
                    child: Text('请使用 花旗担保交易',style: TextStyle(color: Colors.black26),),),
                  Container(
                    child: Row(
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.my_location),onPressed:(){}),
                        Text('${address}')
                      ],
                    ),
                  )
                ],

              ),
            ),
            Container(height: 8.0,color: Colors.black12),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Row(
                  children: <Widget>[
                    Image.network('${dpUrl}'),
                    Container(padding: EdgeInsets.all(10),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('csj',style: TextStyle(fontSize: 23),),
                        //Container(padding: EdgeInsets.fromLTRB(0, 2, 0, 0),),
                        Text('发布了1件宝贝')
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      child: new Text('联系卖家'),
                      color: Colors.orange,
                      onPressed: (){
                        Navigator.push(
                          context,
                          new MaterialPageRoute(builder: (context) => new ChatScreen()),
                        );
                      },
                      textColor: Colors.white,
                    ),),
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      child: new Text('我想购买'),
                      color: Colors.deepOrangeAccent,
                      onPressed: (){
                        Navigator.push(
                          context,
                          new MaterialPageRoute(builder: (context) => new Buyying(briefIntro:'${briefIntro}',
                              money: '${money}',imageUrl: '${imageUrl}',freight: '${freight}')),
                        );
                      },
                      textColor: Colors.white,
                    ),)
                ],
              ),
            )
          ],
        )
    );
  }
}