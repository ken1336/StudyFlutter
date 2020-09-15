import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_app/todo_bloc/model/Rest.dart';

@immutable
abstract class RestEvent extends Equatable {
  RestEvent([List props = const []]) : super(props);
}

//해당 페이지가 그려질때 일어나야 하는 event이다.

class RestInit extends RestEvent {
  @override
  String toString() {

    return "Rest Event:init";
  }
}

class RestUpdate extends RestEvent {
  @override
  String toString() {

    return "Rest Event:update";
  }
}
