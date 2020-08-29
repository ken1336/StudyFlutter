import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './testapp/TestApp.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Startup Name Generator',            
      home: App(),
      

    );
  }
}

