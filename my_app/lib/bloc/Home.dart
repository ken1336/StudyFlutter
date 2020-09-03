import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  HomeState createState() =>HomeState();

}

class HomeState extends State<Home>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Text("BLOC")
      );
  }}