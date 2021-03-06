import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:queuenbuapp/screens/loginpage/login_page.dart';
import 'package:queuenbuapp/screens/test_screen/add_item_page.dart';
import 'package:queuenbuapp/screens/test_screen/item_page.dart';
import 'package:queuenbuapp/screens/test_screen/sec_screens/activity_screen.dart';
import 'package:queuenbuapp/screens/test_screen/sec_screens/discipline_and_sports_screen.dart';
import 'package:queuenbuapp/screens/test_screen/sec_screens/scholarship_and_welfare_screen.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are You Sure?'),
            content: Text('Do you want Sign out?'),
            actions: <Widget>[cancleButton(), okButton()],
          );
        });
  }

  Widget okButton() {
    return FlatButton(
      child: Text('OK'),
      onPressed: () {
        Navigator.of(context).pop();
        processSingOut();
      },
    );
  }

  Widget cancleButton() {
    return FlatButton(
      child: Text('Cacel'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  Future<void> processSingOut() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut().then((response) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Login());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("NBU_EASY"),
        ),
        body: StreamBuilder(
          stream: Firestore.instance.collection("catalog").snapshots(),
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
                                    builder: (context) => ItemPage(
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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage(
                    './assets/test_user.png',
                  ),
                  backgroundColor: Colors.transparent,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),

              // หน้า แผนกกิจกรรมและพัฒนานักศึกษา
              ListTile(
                title: Row(
                  children: <Widget>[
                    // Icon(Icons.add),
                    Text('แผนกกิจกรรมและพัฒนานักศึกษา'),
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ActivityPage()));
                },
              ),

              // หน้า แผนกทุนการศึกษาและสวัสดิการ
              ListTile(
                title: Row(
                  children: <Widget>[
                    // Icon(Icons.add),
                    Text('แผนกทุนการศึกษาและสวัสดิการ'),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScholarshipPage()));
                },
              ),

              // หน้า แผนกวินัยและกีฬา
              ListTile(
                title: Row(
                  children: <Widget>[
                    // Icon(Icons.add),
                    Text('แผนกวินัยและกีฬา'),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DisciplinePage()));
                },
              ),

              // Add item
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    Text('Add Event'),
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddItemPage()));
                },
              ),

              // LogOut
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.exit_to_app),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text('LogOut'),
                  ],
                ),
                onLongPress: () {
                  myAlert();
                },
              ),
            ],
          ),
        ));
  }
}
