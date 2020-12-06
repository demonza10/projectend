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
        backgroundColor: Colors.indigoAccent[700],
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
                      height: 220,
                      width: 120,
                      child: ImageProflie(),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 30, left: 10),
                          // color: Colors.green,
                          child: Text("นาย สรัล ปัทมะทิน",
                              style: TextStyle(fontSize: 20)),
                        ),
                        //Button
                        Container(
                          padding: EdgeInsets.only(right: 30),
                          child: RaisedButton(
                            color: Colors.indigoAccent[700],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            onPressed: () {},
                            child: const Text('Edit Profile',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Text("คิวของฉัน", style: TextStyle(fontSize: 18)),
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
