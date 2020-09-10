import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/todo_bloc/bloc/RestBloc.dart';
import 'package:my_app/todo_bloc/bloc/RestEvent.dart';
import 'package:my_app/todo_bloc/bloc/RestState.dart';

class RestList extends StatefulWidget {
  _RestList createState() => _RestList();
}

class _RestList extends State<RestList> {
  RestBloc _RestBloc;
  @override
  void initState() {
    super.initState();
    _RestBloc = BlocProvider.of<RestBloc>(context);
    _RestBloc.add(RestPop());
  }

  @override
  Widget build(BuildContext context){
    return BlocListener(
      bloc:_RestBloc,
      listener: (BuildContext context, RestState state) {},
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text("Rest Test"),
        ),
        floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () => _RestBloc.add(RestPush()),
      ),
      )
    );


  }
}