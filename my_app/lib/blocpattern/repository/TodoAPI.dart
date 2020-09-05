import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/todo.dart';

class TodoAPI {
  final http.Client _client = http.Client();

  static const String _url = "http://localhost:3001/todos";

  Future<List<Todo>> getTodo() async {
    List<Todo> list = [];

    var data = await _client
        .post(Uri.parse(_url))
        .then((res) => res.body)
        .then(json.decode);
        // .then((todos) =>
        //     todos.forEach((todo) => list.add(Todo.fromJson(todo))
        //     ));
    list.add(Todo.fromJson(data));
    return list;
  }
}