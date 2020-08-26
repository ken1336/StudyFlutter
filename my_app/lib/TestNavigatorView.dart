import 'package:flutter/material.dart';


class TestRouter1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello this is test Router"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Route next"),
          onPressed: ()=>{
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TestRouter2()),
            )
          },
        ),
      )
      
    );
    // TODO: implement build
    
  } 
}

class TestRouter2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello this is test Router 2"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Route back"),
          onPressed: ()=>{
            Navigator.pop(context)
          },
        ),
      )
      
    );
    // TODO: implement build
    
  } 
}