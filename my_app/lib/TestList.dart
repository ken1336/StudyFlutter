import 'package:flutter/material.dart';

class TestList extends StatefulWidget {
  @override
  TestListState createState() => TestListState();
}

class TestListState extends State<TestList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter List view demo'),
      ),
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
    );

    // return ListView.builder(
    //   padding: const EdgeInsets.all(16.0),
    //   itemBuilder:
    // );
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
