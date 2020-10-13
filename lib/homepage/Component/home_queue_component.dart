import 'package:flutter/material.dart';
import 'package:queuenbuapp/navigation/nav.dart';

class Queue extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        createDocWidget('', ''),
        createDocWidget('', ''),
        createDocWidget('', ''),
        createDocWidget('', ''),
        createDocWidget('', ''),
      ]),
    );
  }
}

Container createDocWidget(String imgName, String title) {
  return Container(
    child: InkWell(
      child: Container(
        height: 90,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.indigoAccent[700],
        ),
      ),
    ),
  );
}

//  child: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//  )
