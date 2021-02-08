import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProfileDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: new InputDecoration(labelText: "ชื่อ-นามสกุล"),
              ),
              TextFormField(
                decoration: new InputDecoration(labelText: "รหัสนักศึกษา"),
                keyboardType: TextInputType.number,
              ),
              FlatButton(
                child: Text("ยืนยัน"),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
