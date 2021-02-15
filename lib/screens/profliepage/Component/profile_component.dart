import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:queuenbuapp/screens/profliepage/Widget/profile_widget.dart';

class ProfileDetail extends StatefulWidget {
  @override
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  final formKey = GlobalKey<FormState>();
  String nameString, studentnumberString, emailString, passwordString;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: new InputDecoration(labelText: "ชื่อ-นามสกุล"),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please Fill Your Name in the Blank';
                  } else {
                    return null;
                  }
                },
                onSaved: (String value) {
                  nameString = value.trim();
                },
              ),
              TextFormField(
                decoration: new InputDecoration(labelText: "รหัสนักศึกษา"),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please Fill Your StudentNumber in the Blank';
                  } else {
                    return null;
                  }
                },
                onSaved: (String value) {
                  studentnumberString = value.trim();
                },
                keyboardType: TextInputType.number,
              ),
              FlatButton(
                child: Text("ยืนยัน"),
                color: Colors.blue,
                onPressed: () {
                  print('compile');
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    print('$nameString,$studentnumberString');
                    // setupUserName();
                  }
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> userNameThread() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      setupUserName();
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      // myAlert(title, message);
    });
  }

  Future<void> setupUserName() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.currentUser().then((response) {
      UserUpdateInfo userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = nameString;
      response.updateProfile(userUpdateInfo);

      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Profile());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    });
  }

  Future<void> additem(
      BuildContext context, Map<String, dynamic> data, String documentName) {
    return Firestore.instance
        .collection("userinfo")
        .document(documentName)
        .setData(data);
  }
}

// class ProfileDetail extends StatelessWidget {
//   final formKey = GlobalKey<FormState>();
//   String nameString, studentnumberString, emailString, passwordString;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Form(
//           key: formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: new InputDecoration(labelText: "ชื่อ-นามสกุล"),
//                 validator: (String value) {
//                   if (value.isEmpty) {
//                     return 'Please Fill Your Name in the Blank';
//                   } else {
//                     return null;
//                   }
//                 },
//                 onSaved: (String value) {
//                   nameString = value.trim();
//                 },
//               ),
//               TextFormField(
//                 decoration: new InputDecoration(labelText: "รหัสนักศึกษา"),
//                 validator: (String value) {
//                   if (value.isEmpty) {
//                     return 'Please Fill Your StudentNumber in the Blank';
//                   } else {
//                     return null;
//                   }
//                 },
//                 onSaved: (String value) {
//                   studentnumberString = value.trim();
//                 },
//                 keyboardType: TextInputType.number,
//               ),
//               FlatButton(
//                 child: Text("ยืนยัน"),
//                 color: Colors.blue,
//                 onPressed: () {
//                   print('compile');
//                   if (formKey.currentState.validate()) {
//                     formKey.currentState.save();
//                     print('$nameString,$studentnumberString');
//                     // setupUserName();
//                   }
//                   Navigator.pop(context);
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Future<void> userNameThread() async {
//     FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//     await firebaseAuth
//         .createUserWithEmailAndPassword(
//             email: emailString, password: passwordString)
//         .then((response) {
//       setupUserName();
//     }).catchError((response) {
//       String title = response.code;
//       String message = response.message;
//       // myAlert(title, message);
//     });
//   }

// Future<void> setupUserName() async {
//     FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//     await firebaseAuth.currentUser().then((response) {
//       UserUpdateInfo userUpdateInfo = UserUpdateInfo();
//       userUpdateInfo.username = nameString;
//       response.updateProfile(userUpdateInfo);

//       MaterialPageRoute materialPageRoute =
//           MaterialPageRoute(builder: (BuildContext context) => Profile());
//       Navigator.of(context).pushAndRemoveUntil(
//           materialPageRoute, (Route<dynamic> route) => false);
//     });
//   }

// class Proflie extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//       ),
//       body: Center(
//         child: Container(
//           margin: EdgeInsets.all(10),
//           height: 300,
//           width: 500,
//           child: Card(
//             child: Container(
//                 height: 50,
//                 width: 50,
//                 child: CircleAvatar(
//                   radius: 20.0,
//                   backgroundImage: NetworkImage(
//                       "https://i.pinimg.com/originals/85/b4/06/85b4066060120a0ee602815af9da2d0d.jpg"),
//                   backgroundColor: Colors.transparent,
//                 )),
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:queuenbuapp/navigation/nav.dart';

// class ProfileDetail extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: MyStatefulWidget());
//   }
// }

// class MyStatefulWidget extends StatefulWidget {
//   MyStatefulWidget({Key key}) : super(key: key);

//   @override
//   _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         // mainAxisAlignment: MainAxisAlignment.center,
//         // crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           TextFormField(
//             decoration: const InputDecoration(
//               hintText: 'กรอกชื่อจริง',
//             ),
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//           ),
//           TextFormField(
//             decoration: const InputDecoration(
//               hintText: 'กรอกนามสกุล',
//             ),
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//           ),
//           TextFormField(
//             decoration: const InputDecoration(
//               hintText: 'กรอกรหัสนักศึกษา',
//             ),
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState.validate()) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => BotttomNavBar()),
//                   );
//                 }
//               },
//               child: Text('save'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
