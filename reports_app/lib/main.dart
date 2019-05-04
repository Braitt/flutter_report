import 'package:flutter/material.dart';

import './views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFFFFFFF),
        accentColor: Colors.transparent,
        backgroundColor: Color(0xFFEB6C48),
        cardColor: Color(0xEEFFFFFF),
        buttonColor: Colors.lightBlueAccent
      ),
      home: HomeView(),
    );
  }
}
