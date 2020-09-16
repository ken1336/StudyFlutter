import 'package:flutter/material.dart';
import 'package:bloc_example/rest_bloc/Home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Startup Name Generator',            
      home: Home(),
      

    );
  }
}

