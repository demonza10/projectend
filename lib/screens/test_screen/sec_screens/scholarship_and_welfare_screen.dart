import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:queuenbuapp/screens/test_screen/add_item_scholarship.dart';
import 'package:queuenbuapp/screens/test_screen/item_page.dart';
import 'package:queuenbuapp/screens/test_screen/item_page_scholarship.dart';

class ScholarshipPage extends StatefulWidget {
  ScholarshipPage({Key key}) : super(key: key);

  @override
  _ScholarshipPageState createState() => _ScholarshipPageState();
}

class _ScholarshipPageState extends State<ScholarshipPage> {
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdditemScholarship()));
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("scholarship").snapshots(),
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
                                  builder: (context) => ItemPageScholarship(
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
