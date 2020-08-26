import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


class TestComponent extends StatefulWidget {
  @override
  TestComponentState createState() => TestComponentState();
}

class TestComponentState extends State<TestComponent> {
  //final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  var _viewItems = <Widget>[]
  ..add(_childOne())
  ..add(_childTwo())
  ..add(_childThree());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator',style: _biggerFont),
      ),
      body: _childOne(),
      floatingActionButton: FloatingActionButton(
            // child: Text('Click'),
        child: Icon(Icons.access_alarm),
        onPressed: ()=> {
          print('hello')
          },
      ),
      bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                title: Text('Business'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                title: Text('School'),
              ),
            ],
            selectedItemColor: Colors.amber[800],
            backgroundColor: Colors.blueGrey[100],
            onTap: (int index) => print(index),
      )
    );


  }
}

StatelessWidget _childOne(){
  return
    
     Text("Hello world! I'm child 1");
    

}
StatelessWidget _childTwo(){
  return (
    Text("Hello world! I'm child 2")
  );
}
StatelessWidget _childThree(){
  return (
    Text("Hello world! I'm child 3")
  );
}