import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:queuenbuapp/screens/test_screen/add_item_discipline.dart';
import 'package:queuenbuapp/screens/test_screen/item_page_discipline.dart';

class DisciplinePage extends StatefulWidget {
  DisciplinePage({Key key}) : super(key: key);

  @override
  _DisciplinePageState createState() => _DisciplinePageState();
}

class _DisciplinePageState extends State<DisciplinePage> {
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
                  MaterialPageRoute(builder: (context) => AdditemDiscipline()));
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("discipline").snapshots(),
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
                                  builder: (context) => ItemPageDiscipline(
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
