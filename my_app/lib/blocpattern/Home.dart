import 'package:flutter/material.dart';
import './ui/TodoPage.dart';
import './bloc/TodoProvider.dart';
import './bloc/TodoBloc.dart';
import './repository/TodoAPI.dart';
class Home extends StatefulWidget{
  @override
  HomeState createState() =>HomeState("Home");

}

class HomeState extends State<Home>{

  final String _value;

  HomeState(this._value);
  //HomeState(value) : _value = value;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return TodoProvider(
      todoBloc: TodoBloc(TodoAPI()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: TodoPage(),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(title: Text(_value)),
    //   body: TodoPage(),
    //   );
  }}