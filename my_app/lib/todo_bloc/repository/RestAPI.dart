import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/todo_bloc/model/Rest.dart';

import '../model/todo.dart';

class RestAPI {
  final http.Client _client = http.Client();

  static const String _url = "http://localhost:3001/message";

  Future<Rest> getMessage() async {
    

    final responseData = await _client
    .post(Uri.parse(_url))
    .then((value) => value.statusCode == 200 ? value.body : throw Exception("Rest api error"))
    .then((value) => jsonDecode(value));
    Rest _result = Rest(id: responseData["id"], message:responseData["message"] ); 
    return _result;

    
    
    
  }
}