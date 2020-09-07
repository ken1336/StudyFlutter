import 'package:flutter/material.dart';
import 'package:my_app/todo_bloc/ui/TodoList.dart';
import 'package:my_app/todo_bloc/bloc/TodoListBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


//import 'blocs/todoBloc/bloc.dart';
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

    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoBloc>(
          create: (BuildContext context) => TodoBloc(),
        ),
      ],
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: TodoList(),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(title: Text(_value)),
    //   body: TodoPage(),
    //   );
  }}