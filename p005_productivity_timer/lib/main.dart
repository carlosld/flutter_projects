import 'package:flutter/material.dart';
import 'package:productivity_timer/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final double defaultPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Work Timer',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}
