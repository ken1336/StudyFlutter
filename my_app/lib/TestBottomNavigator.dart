import 'package:flutter/material.dart';


class TestRouter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello this is test Router"),
      ),
      body: TestBottomNavigator(),
      
    );
    // TODO: implement build
    
  } 
}

class TestBottomNavigator extends StatefulWidget{
  @override
  _TestBottomNavigatorState createState() => _TestBottomNavigatorState();


}

class _TestBottomNavigatorState extends State<TestBottomNavigator>{

  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
            body: Text("hi"),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: _currentIndex,
                items: _TestBottomNavigationBarItem.toList(),
            onTap: (index) =>setState((){
              print(index);
              _currentIndex = index;
            })
    ));
  }

}

const List<BottomNavigationBarItem> _TestBottomNavigationBarItem = [
  BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('Home')),
  BottomNavigationBarItem(icon: Icon(Icons.apps),title: Text('apps')),
  BottomNavigationBarItem(icon: Icon(Icons.person),title: Text('person'))
  ];

