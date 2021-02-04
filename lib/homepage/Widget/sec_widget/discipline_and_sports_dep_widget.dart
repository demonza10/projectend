import 'package:flutter/material.dart';
import 'package:queuenbuapp/homepage/Component/home_queue_component.dart';
import 'package:queuenbuapp/homepage/Component/home_slider_component.dart';
import 'package:queuenbuapp/homepage/Component/sec_component/discipline_and_sports_dep_component/discipline_list_component.dart';

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
          Expanded(
            child: Container(
              child: DisciplineList(),
            ),
          ),
        ],
      ),
    );
  }
}
