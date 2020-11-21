import 'package:flutter/material.dart';
import 'package:flutter_sqlite/db_crud.dart';
import 'dart:async';
import 'package:flutter_sqlite/Person.dart';
class FriendView extends StatefulWidget {
  @override
  FriendViewState createState() => FriendViewState();
}

class FriendViewState extends State<FriendView>
    with AutomaticKeepAliveClientMixin {


  var _friendList = [
  ];
  
  
  var _number; 
  //첫번째 방법 -TextEditingController로 input handling
  TextEditingController _c;
  @override
  initState(){
    _c = new TextEditingController();
    _number = 0;
    super.initState();
    

    
    
    //print(await db.people());
  }

 

  //두번째 방법 - 위젯에서 inputAge값을 바로 handling
  String _inputAge;

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: Text("FriendList"),),
      body: ListView.builder(
        itemBuilder: (context, index){
          if(index < _friendList.length) {
            _updateFriendList();
            return _buildPersonItem(_friendList[index]);
          }
        },

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () => showFriendDialog(context),
      ),
    );
  }

// setState((){
//           print("cc");
//           _friendList.add(Person(1,'min'));
//           print(_friendList);

          
//         })
 void _updateFriendList() async {
   var list = await DBHelper.getData('friend');
   var friends = [];
   _number = list.length;
   List.generate(list.length, (i) =>{
     
     friends.add(Person(list[i]['age'], list[i]['name']))
   });
   friends.forEach((element) =>{print(element)});
 
  _friendList = [];
  friends.forEach((element) =>{_friendList.add(Person(element.age, element.name))});
   
   
 }
  void initMinDB(id, name,age) async{
    
    var test = TestPerson(id: id,name: name,age: age);
    
    await DBHelper.insert('friend',test.toMap());

   var tt = await DBHelper.getData('friend');
   print(tt);
  }

  void showFriendDialog(BuildContext context) async {
    
    const _inputNameField =
        InputDecoration(labelText: 'Full Name', hintText: 'eg. John Smith');
    const _inputAgeField = InputDecoration(labelText: 'Age', hintText: 'eg. 20');
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AlertDialog Demo'),
            content: Column(children: <Widget>[
              TextField(
                decoration: _inputNameField,
                controller: _c,
              ),
              TextField(
                decoration:_inputAgeField,
                onChanged: (text) =>setState(
                  (){_inputAge = text;}),
              )
            ]),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    print("input: "+_inputAge+","+_c.text);
                    _friendList.add(Person(int.parse(_inputAge),_c.text));
                    print(_friendList);
                    initMinDB( _number++,_c.text,int.parse(_inputAge));
                    print(_number);
                    
                  });

                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context, "Cancel");
                },
              ),
            ],
          );
        });

  }
}

class Person {
  int age;
  String name;

  Person(
    this.age,
    this.name,
  );
}

 Widget _buildPersonItem(Person person) {

   return new ListTile(
      leading: Icon(Icons.person),
      title: Text(person.name),
      subtitle: Text("${person.age}세"),
  );
}
