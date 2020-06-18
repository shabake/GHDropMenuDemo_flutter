import 'package:flutter/material.dart';
import 'GHFilterDemo.dart';


void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'GHDropMenuDemo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: GHFilterDemo(),
      
    );
  }
}
