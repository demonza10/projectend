import 'package:flutter/material.dart';
import 'package:queuenbuapp/bookingpage/Component/booking_component.dart';
import 'package:queuenbuapp/profliepage/Component/img_profile.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: Container(
          color: Colors.red,
          child: Container(
            margin: EdgeInsets.all(10),
            height: 200,
            width: 500,
            child: Card(
              child: Container(
                height: 200,
                width: 200,
                child: ImageProflie(),
              ),
            ),
          ),
        ));
  }
}
