import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_example/rest_bloc/bloc/RestEvent.dart';
import 'package:bloc_example/rest_bloc/bloc/RestBloc.dart';
import 'package:bloc_example/rest_bloc/bloc/RestState.dart';

class RestUI extends StatefulWidget {
  _RestUI createState() => _RestUI();
}

class _RestUI extends State<RestUI> {
  RestBloc _restBloc;
  @override
  void initState() {
    super.initState();
    _restBloc = BlocProvider.of<RestBloc>(context);
    _restBloc.add(RestInit());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: _restBloc,
        listener: (BuildContext context, RestState state) {},
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Rest Test"),
          ),
          body: BlocBuilder<RestBloc, RestState>(
              bloc: _restBloc,
              builder: (BuildContext context, RestState state) {
                return Text("ID:${state.rest.id} Message: ${state.rest.message}");
              }),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.plus_one),
            onPressed: () => _restBloc.add(RestUpdate()),
          ),
        ));
  }
}
