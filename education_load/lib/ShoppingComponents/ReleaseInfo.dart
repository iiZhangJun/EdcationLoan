import 'package:flutter/material.dart';
import 'package:flutter_yjh/components/CitySelect/CitySelect.dart';
import 'package:image_picker/image_picker.dart';


class ReleaseInfo extends StatefulWidget {

  var location = "";

  @override
  _ReleaseInfoState createState() => _ReleaseInfoState();
}

class _ReleaseInfoState extends State<ReleaseInfo> {
  var _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('我要发布'),
            centerTitle: true,
            backgroundColor: Colors.deepOrangeAccent
        ),
        resizeToAvoidBottomPadding: false,
        //resizeToAvoidBottomInset: false,
        body:
        new ListView(
          children: <Widget>[
            //_ImageView(_image),
            Container(
                height: 250,
                color: Colors.black12,
                //alignment: Alignment.center,
                child: Stack(
                  children: <Widget>[
                    Container(
                      child:  _imageView(_image),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 100,
                            child: RaisedButton(
                              child: new Icon(Icons.add_a_photo,color: Colors.white,size: 40,),
                              shape: CircleBorder(),
                              //elevation: 100,
                              color: Colors.black26,
                              onPressed: (){_modalBottomSheetPhoto(context);},
                            ),
                          ),
                          Text('请选择图片或拍照')
                        ],
                      ),
                    )
                  ],
                )
            ),
            Container(height: 4.0,color: Colors.black26),
            Container(
              height: 200,
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: new Column(
                children: <Widget>[
                  TextField(
                    autofocus: false,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      hintText: '宝贝标题',

                    ),
                  ),
                  TextField(
                    autofocus: false,
                    maxLines: 4,
                    decoration: InputDecoration(
                        hintText: '输入宝贝描述',
                        border: InputBorder.none
                    ),
                  ),
                  Container(
                    //height: 10,
                    child: InkWell(
                      onTap: () async {
                        final result =await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CitySelect(
                            selectCity: widget.location,
                          )),
                        );
                        setState(() {
                          widget.location = result;
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.location_on,size: 20.0,color:Colors.black26 ,),
                          Text(widget.location,style: new TextStyle(color: Colors.black26),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(height: 4.0,color: Colors.black26),
            Container(
              height: 200,
              child: new Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        labelText: '售价(元)'
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        labelText: '运费(元)'
                    ),
                  ),
                  Container(
                    //color: Colors.deepOrangeAccent,
                    child: RaisedButton(
                      child: new Text('发布'),
                      //shape: CircleBorder(),
                      //elevation: 100,
                      color: Colors.deepOrangeAccent,
                      onPressed: (){_dialog(context);},
                      textColor: Colors.white,
                    ),
                  )

                ],
              ),
            )
          ],
        )
    );
  }



  void _modalBottomSheetPhoto(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (builder){
          return Container(
            height: 100,
            child: Column(
              children: <Widget>[
                FlatButton(
                  child: Text('拍照'),
                  onPressed: _takePhoto,
                  splashColor: Colors.transparent,
                ),
                Divider(height: 4,color: Colors.black,),
                FlatButton(
                  onPressed: _openGallery,
                  child: Text("从相册选择"),
                  splashColor: Colors.transparent,
                ),
              ],
            ),
          );
        }
    );
  }

/*图片控件*/
  Widget _imageView(imgPath) {
    if (_image == null) {
      return null;
    } else {
      return Image.file(
        _image,fit:BoxFit.contain,alignment: Alignment.center,width: MediaQuery.of(context).size.width,height: 250,
      );
    }
  }

  Future _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }


  void _dialog(BuildContext context) {
    showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('提示'),

            content: new Text('发布成功，奖励50积分'),
            actions: <Widget>[
              new FlatButton(
                child: new Text('确定'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }
}