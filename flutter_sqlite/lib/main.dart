import 'package:flutter/material.dart';
import 'package:flutter_sqlite/TestList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Startup Name Generator',            
      home: FriendView(),
      

    );
  }
}