import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:bloc_example/rest_bloc/model/Rest.dart';

class RestAPI {
  final _client = Client();
  static const String _url = "http://localhost:3001/message";

  Future<Rest> getMessage() async => await _client
      .post(Uri.parse(_url))
      .then((value) => value.statusCode == 200
          ? value.body
          : throw Exception(["StatusCode: ${value.statusCode}", value.statusCode]))
      .then((value) => jsonDecode(value))
      .then((value) => Rest(id: value["id"], message: value["message"]));
}
