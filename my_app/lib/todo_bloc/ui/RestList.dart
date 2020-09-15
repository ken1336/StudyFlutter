import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/todo_bloc/bloc/RestBloc.dart';
import 'package:my_app/todo_bloc/bloc/RestEvent.dart';
import 'package:my_app/todo_bloc/bloc/RestState.dart';

class RestList extends StatefulWidget {
  _RestList createState() => _RestList();
}

class _RestList extends State<RestList> {
  RestBloc _restBloc;
  @override
  void initState() {
    super.initState();
    _restBloc = BlocProvider.of<RestBloc>(context);
    _restBloc.add(RestInit());
  }

  @override
  Widget build(BuildContext context){
    return BlocListener(
      bloc:_restBloc,
      listener: (BuildContext context, RestState state) {},
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text("Rest Test"),
        ),
        body: BlocBuilder<RestBloc,RestState>(
          bloc: _restBloc,
          builder: (BuildContext context, RestState state){
            return 
            Text(state.restMessage);
          }),
        floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () => _restBloc.add(RestUpdate()),
      ),
      )
    );


  }
}