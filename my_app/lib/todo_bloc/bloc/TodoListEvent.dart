import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TodoListEvent extends Equatable {
  TodoListEvent([List props = const []]) : super(props);
}

//해당 페이지가 그려질때 일어나야 하는 event이다.
class TodoPageLoaded extends TodoListEvent {
  @override
  String toString() {
    // TODO: implement toString
    return "TodoPageLoaded";
  }
}

//각각의 todolist 들의 check box들이 클릭이 됐을때 일어날 event이다.
//indes를 받게 되는 이유는 ListView.builder를 사용하여 화면을 그려줄 예정이기 때문이다.
class TodoListCheck extends TodoListEvent {
  final int index;

  TodoListCheck({@required this.index});

  @override
  String toString() {
    // TODO: implement toString
    return "TodoListCheck";
  }
}