import 'package:flutter/material.dart';
import 'package:queuenbuapp/homepage/Component/home_queue_component.dart';
import 'package:queuenbuapp/homepage/Component/home_slider_component.dart';

class DisciplineDEPwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แผนกวินัยและกีฬา'),
        backgroundColor: Colors.indigoAccent[700],
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Text("test2"),
          ),
        ],
      ),
    );
  }
}
