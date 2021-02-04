import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class EventForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddEvent'),
        backgroundColor: Colors.indigoAccent[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: new InputDecoration(labelText: "ชื่อกรรม"),
              ),
              TextFormField(
                decoration: new InputDecoration(labelText: "รายละเอียด"),
                keyboardType: TextInputType.number,
              ),
              FlatButton(
                child: Text("ยืนยันการเพิ่มกิจกรรม"),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
