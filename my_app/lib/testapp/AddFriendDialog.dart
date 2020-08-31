import 'package:flutter/material.dart';

void showFriendDialog(BuildContext context) async => {

};

showDialog(
            context: context,
            builder: (BuildContext context) {
              // return object of type Dialog
              return AlertDialog(
                  title: new Text("Alert Dialog title"),
                  content: new Text("Alert Dialog body"),
                  actions: <Widget>[
                    new FlatButton(
                        child: new Text("Close"),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ]);
            },
          ),
        )