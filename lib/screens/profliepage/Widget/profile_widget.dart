import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queuenbuapp/providers/transaction_provider.dart';
import 'package:queuenbuapp/screens/profliepage/Component/img_profile.dart';
import 'package:queuenbuapp/screens/profliepage/Component/my_queue.dart';
import 'package:queuenbuapp/screens/profliepage/Widget/add_event_form.dart';
import 'package:queuenbuapp/screens/profliepage/Widget/edit_profile.dart';
import 'package:sembast/sembast.dart';

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
          Consumer(
              builder: (context, TransactionProvider provider, Widget child) {
            // Transaction data = provider.usernames;

            return Card(
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
                        child: Text("username", style: TextStyle(fontSize: 20)),
                      ),
                      Container(
                        // padding: EdgeInsets.only(top: 30, left: 10),
                        // color: Colors.green,
                        child:
                            Text("601110951", style: TextStyle(fontSize: 15)),
                      ),
                      //Button
                      Container(
                        padding: EdgeInsets.only(right: 30),
                        child: RaisedButton(
                          color: Colors.indigoAccent[700],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfile()),
                            );
                          },
                          child: const Text('Edit Profile',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),

          // Container(
          //   // color: Colors.red,
          //   child: Container(
          //     margin: EdgeInsets.all(10),
          //     height: 150,
          //     width: 500,
          //     child:
          //   ),
          // ),

          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 150),
                child: Text("คิวของฉัน", style: TextStyle(fontSize: 18)),
              ),
              Container(
                margin: EdgeInsets.only(left: 100),
                decoration: BoxDecoration(
                    color: Colors.indigoAccent[700],
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return EventForm();
                    }));
                  },
                ),
              )
            ],
          ),
          Container(
            child: Expanded(
              child: Queue(),
            ),
          ),
        ],
      ),
    );
  }
}
