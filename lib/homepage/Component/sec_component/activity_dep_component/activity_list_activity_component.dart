import 'package:flutter/material.dart';
import 'package:queuenbuapp/navigation/nav.dart';

class ActivityList extends StatelessWidget {
  DateTime now = new DateTime.now();
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
        createDocWidget('', ''),
        createDocWidget('', ''),
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
  DateTime now = new DateTime.now();
  return Container(
    child: InkWell(
      child: Container(
        height: 100,
        width: 350,
        child: Card(
          color: Colors.indigoAccent[700],
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: Text("กิจกรรมวิ่งเพื่อสุขภาพ",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 90, top: 20),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 170, top: 20),
                child: Text('$now',
                    style: TextStyle(fontSize: 10, color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
