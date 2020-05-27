import 'package:flutter/material.dart';

class convert extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new convertPageState();
  }
}

class convertPageState extends State<convert> {
  var leftRightPadding = 30.0;
  var topBottomPadding = 4.0;
  var textTips = new TextStyle(fontSize: 16.0, color: Colors.black);
  var hintTips = new TextStyle(fontSize: 15.0, color: Colors.black26);
  bool _newValue2 = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("兑换详情"),
        ),
        body: new Column(
          children: <Widget>[
            new Padding(
              child: new CheckboxListTile(
                title: const Text('兑换花旗点'),
                value: _newValue2,
                onChanged: (bool value) {
                  setState(() {
                    _newValue2 = value;
                  });
                },
              ),
            ),
            new Padding(child: new Text('十个平台积分可兑换1个花旗点')),
            Container(
              margin: new EdgeInsets.only(top: 30.0, bottom: 1.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text('可兑换平台积分：'),
                      Container(
                        child: new TextField(
                          style: hintTips,
                          decoration: new InputDecoration(hintText: "最少填100个"),
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text('花旗点'),
                      Container(
                        child: new TextField(
                          style: hintTips,
                          decoration: new InputDecoration(hintText: "相应的兑换值"),
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Divider(
                color: Colors.black12,
                height: 2.0,
              ),
              margin: new EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
            ),
            new Padding(
              child: new CheckboxListTile(
                title: const Text('兑换减免券'),
                value: _newValue2,
                onChanged: (bool value) {
                  setState(() {
                    _newValue2 = value;
                  });
                },
              ),
            ),
            new Padding(child: new Text('十个平台积分可兑换1元')),
            Container(
              margin: new EdgeInsets.only(top: 30.0, bottom: 1.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text('可兑换平台积分：'),
                      Container(
                        child: new TextField(
                          style: hintTips,
                          decoration: new InputDecoration(hintText: "最少填100个"),
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text('兑换金额'),
                      Container(
                        child: new TextField(
                          style: hintTips,
                          decoration: new InputDecoration(hintText: "相应的兑换值"),
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Divider(
                color: Colors.black12,
                height: 2.0,
              ),
              margin: new EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
            ),
            new Padding(
              child: RaisedButton(
                onPressed: () {},
                child: Text("确认兑换"),
              ),
            ),
          ],
        ));
  }
}
