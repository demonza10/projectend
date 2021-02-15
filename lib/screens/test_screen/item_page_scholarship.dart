import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItemPageScholarship extends StatefulWidget {
  final String evname;
  final String evdescription;
  ItemPageScholarship(
      {Key key, @required this.evname, @required this.evdescription})
      : super(key: key);

  @override
  _ItemPageScholarshipState createState() => _ItemPageScholarshipState();
}

class _ItemPageScholarshipState extends State<ItemPageScholarship> {
  String evdescription = "Please wait...";

  @override
  void initState() {
    super.initState();
    Firestore.instance
        .collection("scholarship")
        .document(widget.evname)
        .get()
        .then((value) {
      setState(() {
        evdescription = value.data["description"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.evname),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.evname,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
            ),
            Text(
              evdescription,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
