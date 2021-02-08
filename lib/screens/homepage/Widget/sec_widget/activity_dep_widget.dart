import 'package:flutter/material.dart';
import 'package:queuenbuapp/screens/homepage/Component/sec_component/activity_dep_component/activity_list_activity_component.dart';

class ActivityDEPwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แผนกกิจกรรมและพัฒนานักศึกษา'),
        backgroundColor: Colors.indigoAccent[700],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: ActivityList(),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
