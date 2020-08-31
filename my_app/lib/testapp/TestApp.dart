import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './BottomNavigator.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Startup Name Generator',            
      home: Scaffold(

        body: TestRouter(),
      ),
      

    );
  }
}

