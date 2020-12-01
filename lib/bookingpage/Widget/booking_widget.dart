import 'package:flutter/material.dart';
import 'package:queuenbuapp/bookingpage/Component/booking_component.dart';

class QueuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Expanded(
          child: SingleChildScrollView(
            child: Container(
              child: EventQueue(),
            ),
          ),
        ),
      ),
    );
  }
}
