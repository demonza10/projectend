import 'dart:io';

import 'package:flutter/material.dart';
import 'package:queuenbuapp/navigation/show_notification.dart';
import 'package:queuenbuapp/service/add_item_service.dart';
import 'package:queuenbuapp/service/logger_service.dart';
import 'package:image_picker/image_picker.dart';

class AddItemPage extends StatefulWidget {
  AddItemPage({Key key}) : super(key: key);

  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final evname = TextEditingController();
  final evdes = TextEditingController();

  //File
  File file;

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
                  Stack(
                    children: <Widget>[
                      showImage(),
                      IconButton(
                        icon: Icon(
                          Icons.add_photo_alternate,
                          size: 50.0,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          chooseImage(ImageSource.gallery);
                        },
                      ),
                    ],
                  ),
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

  Widget showImage() {
    return Container(
      padding: EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: file == null
          ? Image.asset(
              'assets/add_img.png',
            )
          : Image.file(file),
    );
  }

  Future<void> chooseImage(ImageSource imageSource) async {
    try {
      var object = await ImagePicker.pickImage(
        source: imageSource,
        maxWidth: 800.0,
        maxHeight: 800.00,
      );

      setState(() {
        file = object;
      });
      print(file);
    } catch (e) {}
  }
}
