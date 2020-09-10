import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/todo_bloc/model/Rest.dart';

import '../model/todo.dart';

class RestAPI {
  final http.Client _client = http.Client();

  static const String _url = "http://localhost:3001/message";

  Future<Rest> getMessage() async {
    print("call getMessage");

    var data = await _client
        .post(Uri.parse(_url))
        .then((res) => res.body)
        .then(json.decode);
    print("data: "+ data);
    return null;
  }
}