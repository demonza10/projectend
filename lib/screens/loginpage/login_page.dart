import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:queuenbuapp/screens/loginpage/register_page.dart';
import 'package:queuenbuapp/screens/test_screen/home_page.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    chenckState();
  }

  Future<void> chenckState() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if (firebaseUser != null) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => HomePage());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }
  }

  //LOGO
  Widget showLogo() {
    return Container(
      child: Image.asset('./assets/logo_nbu.png'),
    );
  }

  //APPNAME
  Widget showname() {
    return Text('Event and Queue NBU',
        style: TextStyle(
            fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.bold));
  }

  //ปุ่มSingIn
  Widget singUpButton() {
    return OutlineButton(
      child: Text('Sing Up'),
      onPressed: () {
        print('D');
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  //ปุ่มLogIn
  Widget singInButton() {
    return RaisedButton(
      color: Colors.blue.shade900,
      child: Text(
        'Sing In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  //ShowButton
  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        singInButton(),
        SizedBox(
          width: 5.0,
        ),
        singUpButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
            Colors.blue.shade600,
            Colors.blue.shade700,
          ])),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                showLogo(),
                showname(),
                SizedBox(
                  height: 8.0,
                ),
                showButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
