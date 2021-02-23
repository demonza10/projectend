import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  final String evname;
  final String evdescription;
  final String evurlimg;

  ItemPage(
      {Key key,
      @required this.evname,
      @required this.evdescription,
      @required this.evurlimg})
      : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  String evdescription = "Please wait...";
  String evurlimg = "Please wait...";

  @override
  void initState() {
    super.initState();
    Firestore.instance
        .collection("catalog")
        .document(widget.evname)
        .get()
        .then((value) {
      setState(() {
        evdescription = value.data["description"];
        evurlimg = value.data["url"];
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
            Image.network('$evurlimg'),
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
