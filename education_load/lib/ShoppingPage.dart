import 'package:flutter/material.dart';
import 'package:flutter_yjh/ShoppingComponents/DetailInfo.dart';
import 'package:flutter_yjh/ShoppingComponents/ReleaseInfo.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ShoppingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      home:new ShoppingHomePage(),
    );
  }
}

class ShoppingHomePage extends StatefulWidget{
  @override
  createState() => new ShoppingHomePageState();
}

class ShoppingHomePageState extends State<ShoppingHomePage>{
int j=0;
  String _input='';
  final TextEditingController _textEditingController=new TextEditingController();


  List listData=[
    {'briefIntro':'This is a used book','money':'50','imageUrl':'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1105499118,2071057517&fm=26&gp=0.jpg','address':'地址','dpUrl':'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2947095899,3787612098&fm=26&gp=0.jpg','freight':'5'},
    {'briefIntro':'hello','money':'50','imageUrl':'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1105499118,2071057517&fm=26&gp=0.jpg','address':'地址','dpUrl':'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2947095899,3787612098&fm=26&gp=0.jpg','freight':'5'},
    {'briefIntro':'This is a used book','money':'50','imageUrl':'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2262142335,2007866882&fm=26&gp=0.jpg','address':'地址','dpUrl':'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2947095899,3787612098&fm=26&gp=0.jpg','freight':'5'},
    {'briefIntro':'This is a icon','money':'50','imageUrl':'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1105499118,2071057517&fm=26&gp=0.jpg','address':'地址','dpUrl':'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2947095899,3787612098&fm=26&gp=0.jpg','freight':'5'},
    {'briefIntro':'This is a used book','money':'50','imageUrl':'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1105499118,2071057517&fm=26&gp=0.jpg','address':'地址','dpUrl':'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2947095899,3787612098&fm=26&gp=0.jpg','freight':'5'},
    {'briefIntro':'This is a icon','money':'50','imageUrl':'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1105499118,2071057517&fm=26&gp=0.jpg','address':'地址','dpUrl':'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2947095899,3787612098&fm=26&gp=0.jpg','freight':'5'},
    {'briefIntro':'This is a used book','money':'50','imageUrl':'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2262142335,2007866882&fm=26&gp=0.jpg','address':'地址','dpUrl':'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2947095899,3787612098&fm=26&gp=0.jpg','freight':'5'},
    {'briefIntro':'This is a icon','money':'50','imageUrl':'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1105499118,2071057517&fm=26&gp=0.jpg','address':'地址','dpUrl':'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2947095899,3787612098&fm=26&gp=0.jpg','freight':'5'}
  ];
  final List staticData=[
    {'briefIntro':'This is a used book','money':'50','imageUrl':'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1105499118,2071057517&fm=26&gp=0.jpg','address':'地址','dpUrl':'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2947095899,3787612098&fm=26&gp=0.jpg','freight':'5'},
    {'briefIntro':'hello','money':'50','imageUrl':'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1105499118,2071057517&fm=26&gp=0.jpg','address':'地址','dpUrl':'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2947095899,3787612098&fm=26&gp=0.jpg','freight':'5'},
    {'briefIntro':'This is a used book','money':'50','imageUrl':'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2262142335,2007866882&fm=26&gp=0.jpg','address':'地址','dpUrl':'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2947095899,3787612098&fm=26&gp=0.jpg','freight':'5'},
    {'briefIntro':'This is a icon','money':'50','imageUrl':'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1105499118,2071057517&fm=26&gp=0.jpg','address':'地址','dpUrl':'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2947095899,3787612098&fm=26&gp=0.jpg','freight':'5'},
    {'briefIntro':'This is a used book','money':'50','imageUrl':'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1105499118,2071057517&fm=26&gp=0.jpg','address':'地址','dpUrl':'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2947095899,3787612098&fm=26&gp=0.jpg','freight':'5'},
    {'briefIntro':'This is a icon','money':'50','imageUrl':'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1105499118,2071057517&fm=26&gp=0.jpg','address':'地址','dpUrl':'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2947095899,3787612098&fm=26&gp=0.jpg','freight':'5'},
    {'briefIntro':'This is a used book','money':'50','imageUrl':'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2262142335,2007866882&fm=26&gp=0.jpg','address':'地址','dpUrl':'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2947095899,3787612098&fm=26&gp=0.jpg','freight':'5'},
    {'briefIntro':'This is a icon','money':'50','imageUrl':'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1105499118,2071057517&fm=26&gp=0.jpg','address':'地址','dpUrl':'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2947095899,3787612098&fm=26&gp=0.jpg','freight':'5'}
  ];

  Widget _getListData(context,index){
    return InkWell(
        onTap:(){
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new DetailInfo(imageUrl:listData[index]['imageUrl'],
                money:listData[index]['money'],briefIntro:listData[index]['briefIntro'],
                address:listData[index]['address'],dpUrl:listData[index]['dpUrl']
                ,freight:listData[index]['freight'])),
          );
        },
        child: Stack(
          alignment: FractionalOffset.bottomCenter,
          children: <Widget>[
            Center(
              child: Image.network(listData[index]['imageUrl']),
              //heightFactor: 200,
            ),
            Container(
              height: 20.0,
              width: 150,
              alignment: Alignment.center,
              color: Colors.white,
              child: Text(listData[index]['briefIntro'],),
            ),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar://new AppBar(title:new Text(''),),
      new AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        leading: Container(
          height: 36,
          alignment: Alignment.center,
          child: Text('商城',style: TextStyle(fontSize: 16, color: Colors.white),),
        ),
        ///顶部搜索框
        title: Container(
          decoration: new BoxDecoration(
            color: Color.fromARGB(255, 255, 216, 207),
            //color: Colors.white,
            borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
          ),
          //alignment: Alignment.center,
          height: 36,
          width: 270.0,
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 10,
                child: TextField(
                  cursorColor: Color.fromARGB(255, 160, 158, 157), //设置光标
                  decoration: InputDecoration(
                      contentPadding: new EdgeInsets.only(left: 10.0,top: 8.0,bottom: 7),
                      fillColor: Color.fromARGB(255, 255, 216, 207),
                      border: InputBorder.none,
                      hintText: "请输入关键字",
                      hintStyle: new TextStyle(fontSize: 16, color: Color.fromARGB(255, 160, 158, 157))),
                  style: new TextStyle(fontSize: 16, color: Colors.black87),
                  controller: _textEditingController,
                ),
              ),
              Expanded(
                flex: 2,
                child: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: (){setState(() {
                    _textEditingController.clear();
                  });},
                  splashColor: Colors.transparent,alignment: Alignment.center,),
              )
            ],
          )
        ),

        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search, color: Colors.white,),
              onPressed: (){
                //showSearch(context: context, delegate:SearchBarDelegate() );
                _showSearch();
              }
          ),
        ],
        centerTitle: true,
      ),
      body: _buildBody(),
      resizeToAvoidBottomPadding: false,
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new ReleaseInfo()),
          );
        },
        //child: new Icon(Icons.add_a_photo),
        child: new Text('发布'),
        elevation: 3.0,
        highlightElevation: 2.0,
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }

  //@override
  Widget _buildBody() {
    return GridView.builder(
        itemCount: listData.length,
        padding: EdgeInsets.symmetric(horizontal: 16,vertical:30),
        //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //横轴元素个数
            crossAxisCount: 2,

            //纵轴间距
            mainAxisSpacing: 50.0,
            //横轴间距
            crossAxisSpacing: 30.0,
            //子组件宽高长度比例
            childAspectRatio: 0.8),
        itemBuilder: this._getListData);
  }

  void _showSearch(){
    /*setState(() {
      j=0;
    });*/
    j=0;
    _input=_textEditingController.text;
    var _selectData=new List();
    if(_input.isEmpty || _input==null){
      setState(() {
        listData=staticData;
      });
      return;
    }
    //var j=0;

    for(var item in staticData){
      if(item['briefIntro'].contains(_input)) {
        _selectData.insert(j++, item);
      }

    }

    if(j==0){
      setState(() {
        listData=staticData;
        Fluttertoast.showToast(msg: "亲亲，暂时还没有人发布此物品呢", toastLength:Toast.LENGTH_SHORT,gravity: ToastGravity.TOP,
        backgroundColor:Colors.deepOrangeAccent,textColor: Colors.white);
      });
    }
    else{
      setState(() {
        listData=_selectData;//搜索之后只能显示一个，若搜出来多个东西，j都为2，且报错
      });
    }


  }
}




