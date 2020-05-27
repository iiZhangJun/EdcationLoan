import 'package:flutter/material.dart';
import 'package:flutter_yjh/page/personal_page.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PersonalPage(),
      ),
    );
  }
}