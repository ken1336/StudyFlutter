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
    
    final response = await _client
        .post(Uri.parse(_url));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      Rest _result = Rest(id: data["id"], message:data["message"] ); 
      print("_result: "+ _result.message);
      return _result;
    }else{
      print("Rest call error");
      return null;
    }
        
        
    
    
    
  }
}