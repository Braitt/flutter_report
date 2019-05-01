import 'package:flutter/material.dart';
import './views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.teal,
        backgroundColor: Color(0xFF0eb593),
        cardColor: Color(0xEED6DFDF),
      ),
      home: HomeView(),
    );
  }
}
