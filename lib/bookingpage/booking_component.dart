import 'package:flutter/material.dart';

class EventQueue extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
          height: 200,
          width: 500,
          child: Card(
            child: (Text("data")),
          )),
    ));
  }
}
