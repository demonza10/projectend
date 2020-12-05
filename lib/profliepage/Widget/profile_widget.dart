import 'package:flutter/material.dart';
import 'package:queuenbuapp/bookingpage/Component/booking_component.dart';
import 'package:queuenbuapp/profliepage/Component/button_profile.dart';
import 'package:queuenbuapp/profliepage/Component/img_profile.dart';
import 'package:queuenbuapp/profliepage/Component/my_queue.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            // color: Colors.red,
            child: Container(
              margin: EdgeInsets.all(10),
              height: 150,
              width: 500,
              child: Card(
                child: Row(
                  children: <Widget>[
                    //Profile
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 200,
                      width: 100,
                      child: ImageProflie(),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          // color: Colors.green,
                          child: Text("นาย สรัล ปัทมะทิน"),
                        ),
                        //Button
                        Container(
                          height: 100,
                          width: 200,
                          child: ButtonProflie(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Text("คิวของฉัน"),
          ),
          Container(
            child: Expanded(
              child: SingleChildScrollView(
                child: MyQueue(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
