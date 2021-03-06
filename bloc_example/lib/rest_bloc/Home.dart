import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_example/rest_bloc/bloc/RestBloc.dart';
import 'package:bloc_example/rest_bloc/ui/RestUI.dart';

class Home extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MultiBlocProvider(
      providers: [
        BlocProvider<RestBloc>(
          create: (BuildContext context)=> RestBloc(),
        ),
      ],
      child: MaterialApp(
        home: RestUI(),
      ),
    );
  }

}