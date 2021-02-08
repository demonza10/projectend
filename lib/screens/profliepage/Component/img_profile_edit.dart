import 'package:flutter/material.dart';

class ImageProflieEdit extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.blue,
        // color: Colors.indigoAccent[700],
        child: CircleAvatar(
          radius: 100,
          backgroundImage: NetworkImage(
              "https://i.pinimg.com/originals/85/b4/06/85b4066060120a0ee602815af9da2d0d.jpg"),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
