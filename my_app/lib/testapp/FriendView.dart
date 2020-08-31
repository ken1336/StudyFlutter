import 'package:flutter/material.dart';

class FriendView extends StatefulWidget {
  @override
  FriendViewState createState() => FriendViewState();
}

class FriendViewState extends State<FriendView>
    with AutomaticKeepAliveClientMixin {


  var _friendList = [
    Person(21, "min"),
    Person(25, "Lee"),
    Person(24, "Ledger"),
    Person(22, "John"),
    Person(27, "Tim"),
    Person(28, "Asher"),
    Person(31, "min1"),
    Person(24, "min2"),
    Person(22, "min3"),
  ];

  //첫번째 방법 -TextEditingController로 input handling
  TextEditingController _c;
  @override
  initState() {
    _c = new TextEditingController();
    super.initState();
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
