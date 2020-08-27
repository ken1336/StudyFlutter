import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './main_1.dart';
import './TestComponent1.dart';
import './TestNavigatorView.dart';
import './TestBottomNavigator.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Startup Name Generator',            
      home: TestRouter(),
      

    );
  }
}

