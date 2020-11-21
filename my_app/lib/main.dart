import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './testapp/TestApp.dart';
// import './blocpattern/Home.dart';
import 'package:my_app/todo_bloc/Home.dart';
import 'package:my_app/TestList.dart';
import 'package:my_app/testapp/FriendView.dart';

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

