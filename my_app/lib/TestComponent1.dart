import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


class TestComponent extends StatefulWidget {
  @override
  TestComponentState createState() => TestComponentState();
}

class TestComponentState extends State<TestComponent> {
  //final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator',style: _biggerFont),
      ),
      body: _childOne(),
    );


  }
}
Widget _childOne(){
  return Column(
    
    children: [Text("Hello world! I'm child 1"), _childTwo()]
    
  );
}
Widget _childTwo(){
  return (
    Text("Hello world! I'm child 2")
  );
}