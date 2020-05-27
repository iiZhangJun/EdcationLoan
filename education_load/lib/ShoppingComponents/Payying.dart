import 'package:flutter/material.dart';
import 'package:flutter_yjh/page/index_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:education_load/ShoppingPage.dart';

var pi = 3.14;

//支付密码  +  自定义键盘
class Payying extends StatefulWidget {
  static final String sName = "enter";

  @override
  State<StatefulWidget> createState() {
    return new PayyingState();
  }
}

class PayyingState extends State<Payying> {
  /// 用户输入的密码
  String pwdData = '';

  /*
    GlobalKey：整个应用程序中唯一的键
    ScaffoldState：Scaffold框架的状态
    解释：_scaffoldKey的值是Scaffold框架状态的唯一键
   */
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // VoidCallback：没有参数并且不返回数据的回调
  VoidCallback _showBottomSheetCallback;

  @override
  void initState() {
    _showBottomSheetCallback = _showBottomSheet;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext c) {
    return new Container(
      width: double.maxFinite,
      height: 300.0,
      color: Color(0xffffffff),
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: new Text(
              '请输入支付密码',
              style: new TextStyle(fontSize: 18.0, color: Color(0xff333333)),
            ),
          ),

          ///密码框
          new Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: _buildPwd(pwdData),
          ),
        ],
      ),
    );
  }

  /// 构建 密码输入框  定义了其宽度和高度
  Widget _buildPwd(var pwd) {
    return new GestureDetector(
      child: new Container(
        width: 250.0,
        height: 40.0,
//      color: Colors.white,  自定义密码输入框的使用
        child: new CustomJPasswordField(pwd),
      ),
// 用户点击输入框的时候，弹出自定义的键盘
      onTap: () {
        _showBottomSheetCallback();
      },
    );
  }

  /// 底部弹出 自定义键盘  下滑消失
  void _showBottomSheet() {
    setState(() {
      // disable the button  // 禁用按钮
      _showBottomSheetCallback = null;
    });

    /*
      currentState：获取具有此全局键的树中的控件状态
      showBottomSheet：显示持久性的质感设计底部面板
      解释：联系上文，_scaffoldKey是Scaffold框架状态的唯一键，因此代码大意为，
           在Scaffold框架中显示持久性的质感设计底部面板
     */
    _scaffoldKey.currentState
        .showBottomSheet<void>((BuildContext context) {
          /// 将自定义的密码键盘作为其child   这里将回调函数传入
          return new MyKeyboard(_onKeyDown);
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              // re-enable the button  // 重新启用按钮
              _showBottomSheetCallback = _showBottomSheet;
            });
          }
        });
  }

  /// 密码键盘的整体回调，根据不同的按钮事件来进行相应的逻辑实现
  void _onKeyDown(KeyEvent data) {
// 如果点击了删除按钮，则将密码进行修改
    if (data.isDelete()) {
      if (pwdData.length > 0) {
        pwdData = pwdData.substring(0, pwdData.length - 1);
        setState(() {});
      }
    }
// 点击了确定按钮时
    else if (data.isCommit()) {
      if (pwdData.length != 6) {
        Fluttertoast.showToast(
            msg: "密码不足6位，请重试",
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.deepOrangeAccent);
        return;
      }
      onAffirmButton();
    }
//点击了数字按钮时  将密码进行完整的拼接
    else {
      if (pwdData.length < 6) {
        pwdData += data.key;
      }
      setState(() {});
    }
  }

  /// 密码键盘 确认按钮 事件
  void onAffirmButton() {
    _dialog(context);
  }

  void _dialog(BuildContext context) {
    showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('提示'),
            content: new Text('支付成功，奖励60积分'),
            actions: <Widget>[
              new FlatButton(
                child: new Text('确定'),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => new IndexPage(
                          pageIndex: 3,
                        ),
                      ),
                      (route) => route == null);
                },
              ),
            ],
          );
        });
  }
}

///  自定义 密码输入框 第一步 —— 使用画笔画出单个的框
class CustomJPasswordField extends StatelessWidget {
  ///  传入当前密码
  String data;

  CustomJPasswordField(this.data);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyCustom(data),
    );
  }
}

///  继承CustomPainter ，来实现自定义图形绘制
class MyCustom extends CustomPainter {
  ///  传入的密码，通过其长度来绘制圆点
  String pwdLength;

  MyCustom(this.pwdLength);

  ///  此处Sizes是指使用该类的父布局大小
  @override
  void paint(Canvas canvas, Size size) {
    // 密码画笔
    Paint mPwdPaint;
    Paint mRectPaint;

    // 初始化密码画笔
    mPwdPaint = new Paint();
    mPwdPaint.color = Colors.black;

//   mPwdPaint.setAntiAlias(true);
    // 初始化密码框
    mRectPaint = new Paint();
    mRectPaint.color = Color(0xff707070);

    ///  圆角矩形的绘制
    RRect r = new RRect.fromLTRBR(0.0, 0.0, size.width, size.height,
        new Radius.circular(size.height / 12));

    ///  画笔的风格
    mRectPaint.style = PaintingStyle.stroke;
    canvas.drawRRect(r, mRectPaint);

    ///  将其分成六个 格子（六位支付密码）
    var per = size.width / 6.0;
    var offsetX = per;
    while (offsetX < size.width) {
      canvas.drawLine(new Offset(offsetX, 0.0),
          new Offset(offsetX, size.height), mRectPaint);
      offsetX += per;
    }

    ///  画实心圆
    var half = per / 2;
    var radio = per / 8;
    mPwdPaint.style = PaintingStyle.fill;

    ///  当前有几位密码，画几个实心圆
    for (int i = 0; i < pwdLength.length && i < 6; i++) {
      canvas.drawArc(
          new Rect.fromLTRB(i * per + half - radio, size.height / 2 - radio,
              i * per + half + radio, size.height / 2 + radio),
          0.0,
          2 * pi,
          true,
          mPwdPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

///  自定义 键盘 按钮
class CustomKbBtn extends StatefulWidget {
  ///  按钮显示的文本内容
  String text;

  CustomKbBtn({Key key, this.text, this.callback}) : super(key: key);

  ///  按钮 点击事件的回调函数
  final callback;

  @override
  State<StatefulWidget> createState() {
    return ButtonState();
  }
}

class ButtonState extends State<CustomKbBtn> {
  ///回调函数执行体
  var backMethod;

  void back() {
    widget.callback('$backMethod');
  }

  @override
  Widget build(BuildContext context) {
    /// 获取当前屏幕的总宽度，从而得出单个按钮的宽度
    MediaQueryData mediaQuery = MediaQuery.of(context);
    var _screenWidth = mediaQuery.size.width;

    return new Container(
        height: 50.0,
        width: _screenWidth / 3,
        child: new OutlineButton(
          // 直角
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(0.0)),
          // 边框颜色
          borderSide: new BorderSide(color: Color(0x10333333)),
          child: new Text(
            widget.text,
            style: new TextStyle(color: Color(0xff333333), fontSize: 20.0),
          ),
          // 按钮点击事件
          onPressed: back,
        ));
  }
}

/// 自定义密码 键盘

class MyKeyboard extends StatefulWidget {
  final callback;

  MyKeyboard(this.callback);

  @override
  State<StatefulWidget> createState() {
    return new MyKeyboardStat();
  }
}

class MyKeyboardStat extends State<MyKeyboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /// 定义 确定 按钮 接口  暴露给调用方
  ///回调函数执行体
  var backMethod;

  void onCommitChange() {
    widget.callback(new KeyEvent("commit"));
  }

  void onOneChange(BuildContext cont) {
    widget.callback(new KeyEvent("1"));
  }

  void onTwoChange(BuildContext cont) {
    widget.callback(new KeyEvent("2"));
  }

  void onThreeChange(BuildContext cont) {
    widget.callback(new KeyEvent("3"));
  }

  void onFourChange(BuildContext cont) {
    widget.callback(new KeyEvent("4"));
  }

  void onFiveChange(BuildContext cont) {
    widget.callback(new KeyEvent("5"));
  }

  void onSixChange(BuildContext cont) {
    widget.callback(new KeyEvent("6"));
  }

  void onSevenChange(BuildContext cont) {
    widget.callback(new KeyEvent("7"));
  }

  void onEightChange(BuildContext cont) {
    widget.callback(new KeyEvent("8"));
  }

  void onNineChange(BuildContext cont) {
    widget.callback(new KeyEvent("9"));
  }

  void onZeroChange(BuildContext cont) {
    widget.callback(new KeyEvent("0"));
  }

  /// 点击删除
  void onDeleteChange() {
    widget.callback(new KeyEvent("del"));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      key: _scaffoldKey,
      width: double.infinity,
      height: 250.0,
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new Container(
            height: 30.0,
            color: Colors.white,
            alignment: Alignment.center,
            child: new Text(
              '下滑隐藏',
              style: new TextStyle(fontSize: 12.0, color: Color(0xff999999)),
            ),
          ),

          ///  键盘主体
          new Column(
            children: <Widget>[
              ///  第一行
              new Row(
                children: <Widget>[
                  CustomKbBtn(
                      text: '1', callback: (val) => onOneChange(context)),
                  CustomKbBtn(
                      text: '2', callback: (val) => onTwoChange(context)),
                  CustomKbBtn(
                      text: '3', callback: (val) => onThreeChange(context)),
                ],
              ),

              ///  第二行
              new Row(
                children: <Widget>[
                  CustomKbBtn(
                      text: '4', callback: (val) => onFourChange(context)),
                  CustomKbBtn(
                      text: '5', callback: (val) => onFiveChange(context)),
                  CustomKbBtn(
                      text: '6', callback: (val) => onSixChange(context)),
                ],
              ),

              ///  第三行
              new Row(
                children: <Widget>[
                  CustomKbBtn(
                      text: '7', callback: (val) => onSevenChange(context)),
                  CustomKbBtn(
                      text: '8', callback: (val) => onEightChange(context)),
                  CustomKbBtn(
                      text: '9', callback: (val) => onNineChange(context)),
                ],
              ),

              ///  第四行
              new Row(
                children: <Widget>[
                  CustomKbBtn(text: '删除', callback: (val) => onDeleteChange()),
                  CustomKbBtn(
                      text: '0', callback: (val) => onZeroChange(context)),
                  CustomKbBtn(text: '确定', callback: (val) => onCommitChange()),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

///  支符密码  用于 密码输入框和键盘之间进行通信
class KeyEvent {
  ///  当前点击的按钮所代表的值
  String key;

  KeyEvent(this.key);

  bool isDelete() => this.key == "del";

  bool isCommit() => this.key == "commit";
}
