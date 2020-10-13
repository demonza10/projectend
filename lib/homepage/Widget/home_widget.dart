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
