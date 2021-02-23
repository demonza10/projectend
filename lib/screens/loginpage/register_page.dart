import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:queuenbuapp/screens/test_screen/home_page.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Explicit
  final formKey = GlobalKey<FormState>();
  String nameString, studentidString, emailString, passwordString;

  //Method

  //
  //ปุ่มLogIn
  Widget confirmButton() {
    return RaisedButton(
      color: Colors.blue.shade900,
      child: Text(
        'confirm',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print('confirm');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print(
              'name = $nameString, studentID = $studentidString, Email = $emailString, Password = $passwordString');
          registerThread();
        }
      },
    );
  }

  Future<void> registerThread() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('Register Success for Email = $emailString');
      setupUserName();
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      print('title:$title, message:$message');
      myAlert(title, message);
    });
  }

  Future<void> setupUserName() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.currentUser().then((response) {
      UserUpdateInfo userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = nameString;
      response.updateProfile(userUpdateInfo);

      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext) => HomePage());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    });
  }

  void myAlert(String title, String messsage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: ListTile(
              leading: Icon(
                Icons.add_alert,
                color: Colors.red,
              ),
              title: Text(
                title,
                style: TextStyle(color: Colors.red),
              ),
            ),
            content: Text(messsage),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  //
  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.people,
            color: Colors.blue.shade900,
          ),
          labelText: 'User Name :',
          labelStyle: TextStyle(
            color: Colors.blue.shade900,
            fontWeight: FontWeight.bold,
          )),
      validator: (String valuel) {
        if (valuel.isEmpty) {
          return 'Please Fill Your Name in the Blank';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        nameString = value.trim();
      },
    );
  }

  //
  Widget studentIdText() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.face,
            color: Colors.blue.shade900,
          ),
          labelText: 'Student ID : ',
          labelStyle: TextStyle(
            color: Colors.blue.shade900,
            fontWeight: FontWeight.bold,
          )),
      validator: (String valuel) {
        if (valuel.isEmpty) {
          return 'Please Fill Your Student ID in the Blank';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        studentidString = value.trim();
      },
    );
  }

  //
  Widget statusText() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.star,
            color: Colors.blue.shade900,
          ),
          labelText: 'Status :',
          labelStyle: TextStyle(
            color: Colors.blue.shade900,
            fontWeight: FontWeight.bold,
          )),
      // validator: (String valuel) {
      //   if (valuel.isEmpty) {
      //     return 'Please Fill Your Status in the Blank';
      //   } else {
      //     return null;
      //   }
      // },
      // onSaved: (String value) {
      //   nameString = value.trim();
      // },
    );
  }

  //
  Widget emailText() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.email,
            color: Colors.blue.shade900,
          ),
          labelText: 'Email :',
          labelStyle: TextStyle(
            color: Colors.blue.shade900,
            fontWeight: FontWeight.bold,
          )),
      validator: (String valuel) {
        if (!((valuel.contains('@')) && (valuel.contains('.')))) {
          return 'Please Type Your Email in Exp. you@email.com';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        emailString = value.trim();
      },
    );
  }

  //
  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.vpn_key,
            color: Colors.blue.shade900,
          ),
          labelText: 'Password :',
          labelStyle: TextStyle(
            color: Colors.blue.shade900,
            fontWeight: FontWeight.bold,
          )),
      validator: (String valuel) {
        if (valuel.length < 6) {
          return 'Password More 6 Charactor';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        passwordString = value.trim();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rigister'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(30.0),
          children: <Widget>[
            nameText(),
            studentIdText(),
            statusText(),
            emailText(),
            passwordText(),
            SizedBox(
              height: 10.0,
            ),
            confirmButton()
          ],
        ),
      ),
    );
  }
}
