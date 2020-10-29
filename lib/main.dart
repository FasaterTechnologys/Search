import 'package:flutter/material.dart';
import 'package:searchpro/Home/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Search",
      theme: ThemeData(
          primaryColor: Color.fromRGBO(255, 255, 255, 1),
          textTheme: TextTheme(title: TextStyle(color: Colors.white))),
      home: Home(),
    );
  }
}
