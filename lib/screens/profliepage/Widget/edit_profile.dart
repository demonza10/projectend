import 'package:flutter/material.dart';
import 'package:queuenbuapp/screens/profliepage/Component/img_profile_edit.dart';
import 'package:queuenbuapp/screens/profliepage/Component/profile_component.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.indigoAccent[700],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 150,
            width: 200,
            margin: EdgeInsets.only(left: 50, right: 50),
            child: ImageProflieEdit(),
          ),
          Container(
            height: 500,
            width: 500,
            child: ProfileDetail(),
          ),
        ],
      ),
    );
  }
}
