import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Database',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Database'),
    );
  }
}
