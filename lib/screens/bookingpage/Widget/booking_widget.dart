import 'package:flutter/material.dart';
import 'package:queuenbuapp/screens/bookingpage/Component/booking_component.dart';

class QueuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyQueue'),
          backgroundColor: Colors.indigoAccent[700],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: EventQueue(),
              ),
            ),
          ],
        ));
  }
}
