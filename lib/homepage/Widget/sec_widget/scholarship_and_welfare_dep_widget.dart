import 'package:flutter/material.dart';
import 'package:queuenbuapp/homepage/Component/home_queue_component.dart';
import 'package:queuenbuapp/homepage/Component/home_slider_component.dart';
import 'package:queuenbuapp/homepage/Component/sec_component/scholarship_and_welfare_dep_component/scholarship_list_component.dart';

class ScholarshipDEPwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แผนกทุนการศึกษาและสวัสดิการ'),
        backgroundColor: Colors.indigoAccent[700],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: ScholarshipList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
