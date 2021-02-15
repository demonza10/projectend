import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItemPageDiscipline extends StatefulWidget {
  final String evname;
  final String evdescription;
  ItemPageDiscipline(
      {Key key, @required this.evname, @required this.evdescription})
      : super(key: key);

  @override
  _ItemPageDisciplineState createState() => _ItemPageDisciplineState();
}

class _ItemPageDisciplineState extends State<ItemPageDiscipline> {
  String evdescription = "Please wait...";

  @override
  void initState() {
    super.initState();
    Firestore.instance
        .collection("discipline")
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
