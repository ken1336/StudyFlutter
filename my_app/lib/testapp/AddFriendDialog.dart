import 'package:flutter/material.dart';

class AddFriendDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text("Alert Dialog title"),
      content: new Text("Alert Dialog body"),
      actions: <Widget>[
        new FlatButton(
          child: new Text("Close"),
        ),
      ],
    );
  }
}
