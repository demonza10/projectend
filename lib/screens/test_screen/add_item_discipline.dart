import 'package:flutter/material.dart';
import 'package:queuenbuapp/navigation/show_notification.dart';
import 'package:queuenbuapp/service/add_item_discipline_service.dart';
import 'package:queuenbuapp/service/logger_service.dart';

class AdditemDiscipline extends StatefulWidget {
  AdditemDiscipline({Key key}) : super(key: key);

  @override
  _AdditemDisciplineState createState() => _AdditemDisciplineState();
}

class _AdditemDisciplineState extends State<AdditemDiscipline> {
  final evname = TextEditingController();
  final evdes = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Event"),
        backgroundColor: Colors.indigoAccent[700],
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: "Event Name"),
                    controller: evname,
                  ),
                  Padding(padding: const EdgeInsets.all(10)),
                  TextField(
                    decoration: InputDecoration(labelText: "Event Description"),
                    controller: evdes,
                  ),
                  Padding(padding: const EdgeInsets.all(10)),
                  RaisedButton(
                    child: Text("confirm"),
                    onPressed: () {
                      if (evname.text == "" || evdes.text == "") {
                        showMessageBox(context, "Error",
                            "Please enter name and description before adding it to firebase",
                            actions: [dismissButton(context)]);
                        logger.e("evname or evdes can't be null");
                      } else {
                        addItem(
                            context,
                            {"name": evname.text, "description": evdes.text},
                            evname.text);
                        evname.text = "";
                        evdes.text = "";
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
