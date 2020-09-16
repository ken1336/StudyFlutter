import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkView extends StatefulWidget {
  @override
  NetworkViewState createState() => NetworkViewState();
}

class NetworkViewState extends State<NetworkView> {
  var _recvText = "Wait recv...";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Network query")),
        body: Column(
          children: [
            Text(_recvText),
            RaisedButton(
              child: Text("Query to server"),
              onPressed: () => _requestTest(),
            ),
          ],
        ));
  }


  void _requestTest() {
    _fetchString().then((String result){
      setState(() {
        _recvText = result;
      });
    });
  }
}
 

Future<String> _fetchString() async {
  final response = await http.get('http://localhost:3001/test');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //return json.decode(response.body);
    return response.body;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
