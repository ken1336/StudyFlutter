import 'package:flutter/material.dart';

class FriendView extends StatefulWidget {
  @override
  FriendViewState createState() => FriendViewState();
}

class FriendViewState extends State<FriendView>
    with AutomaticKeepAliveClientMixin {
  var _count = 0;
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Friend(Person(21, "min")),
            Friend(Person(25, "Lee")),
            Friend(Person(24, "Ledger")),
            Friend(Person(22, "John")),
            Friend(Person(27, "Tim")),
            Friend(Person(28, "Asher")),
            Friend(Person(31, "min1")),
            Friend(Person(24, "min2")),
            Friend(Person(22, "min3")),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.plus_one),
          onPressed: () => AlertDialog(
            title: new Text("Alert Dialog title"),
            content: new Text("Alert Dialog body"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Close"),
              ),
            ],
          ),
        ));
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

class Friend extends StatelessWidget {
  Friend(this._person);

  final Person _person;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(_person.name),
      subtitle: Text("${_person.age}세"),
    );
  }
}
