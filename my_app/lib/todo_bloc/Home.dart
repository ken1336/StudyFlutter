import 'package:flutter/material.dart';
import 'package:my_app/todo_bloc/ui/TodoList.dart';
import 'package:my_app/todo_bloc/bloc/TodoListBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_app/todo_bloc/bloc/RestBloc.dart';
import 'package:my_app/todo_bloc/ui/RestList.dart';


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
  Widget build(BuildContext context){
    return MultiBlocProvider(
      providers: [
        BlocProvider<RestBloc>(
          create: (BuildContext context)=> RestBloc(),
        
        ),
      ],
      child: MaterialApp(
        home: RestList(),
      ),
    );
  }

}