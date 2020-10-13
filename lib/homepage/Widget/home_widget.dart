import 'package:flutter/material.dart';
import 'package:queuenbuapp/homepage/Component/home_queue_component.dart';
import 'package:queuenbuapp/homepage/Component/home_slider_component.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 250,
            child: ReviewSlide(),
          ),
          Container(
            margin: EdgeInsets.only(
              right: 140,
              top: 10,
            ),
            height: 50,
            child: Text(
              "กิจกรรมจิตอาสา",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Container(
              child: Queue(),
            ),
          ))
        ],
      ),
    );
  }
}
