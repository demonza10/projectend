import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:queuenbuapp/screens/test_screen/add_item_activity.dart';
import 'package:queuenbuapp/screens/test_screen/item_page.dart';
import 'package:queuenbuapp/screens/test_screen/item_page_activity.dart';

class ActivityPage extends StatefulWidget {
  ActivityPage({Key key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("แผนกกิจกรรมและพัฒนานักศึกษา"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddItemActivity()));
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("userinfo").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Column(
                children: <Widget>[
                  CircularProgressIndicator(),
                  Text("Loading . . . "),
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ItemPageActivity(
                                        evname: snapshot
                                            .data.documents[index].documentID,
                                        evdescription: snapshot
                                            .data
                                            .documents[index]
                                            .data["description"],
                                      )));
                        },
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                  snapshot.data.documents[index].documentID),
                              subtitle: Text(snapshot
                                  .data.documents[index].data["description"]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
