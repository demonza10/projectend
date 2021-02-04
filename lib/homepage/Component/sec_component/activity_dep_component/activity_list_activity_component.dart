import 'package:flutter/material.dart';

class ActivityList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, int index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: FittedBox(),
              ),
              title: Text("GGWP"),
              subtitle: Text("02/02/2021"),
            ),
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class ActivityList extends StatelessWidget {
//   DateTime now = new DateTime.now();
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: InkWell(
//         child: Container(
//           height: 100,
//           width: 350,
//           child: Card(
//             color: Colors.indigoAccent[700],
//             child: Column(
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     Container(
//                       margin: EdgeInsets.only(left: 20, top: 20),
//                       child: Text("กิจกรรมวิ่งเพื่อสุขภาพ",
//                           style: TextStyle(fontSize: 20, color: Colors.white)),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(left: 60, top: 15),
//                       child: IconButton(
//                         icon: Icon(Icons.edit),
//                         onPressed: () {
//                           // Navigator.push(null,MaterialPageRoute(builder: null))
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(right: 170, top: 5),
//                   child: Text('$now',
//                       style: TextStyle(fontSize: 10, color: Colors.white)),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
// Container(
//   child: Column(children: <Widget>[
//     createDocWidget('', ''),
//     createDocWidget('', ''),
//     createDocWidget('', ''),
//     createDocWidget('', ''),
//     createDocWidget('', ''),
//     createDocWidget('', ''),
//     createDocWidget('', ''),
//     createDocWidget('', ''),
//     createDocWidget('', ''),
//     createDocWidget('', ''),
//     createDocWidget('', ''),
//     createDocWidget('', ''),
//   ]),
// );
//   }
// }

// Container createDocWidget(String imgName, String title) {
//   DateTime now = new DateTime.now();
//   return Container(
//     child: InkWell(
//       child: Container(
//         height: 100,
//         width: 350,
//         child: Card(
//           color: Colors.indigoAccent[700],
//           child: Column(
//             children: <Widget>[
//               Row(
//                 children: <Widget>[
//                   Container(
//                     margin: EdgeInsets.only(left: 20, top: 20),
//                     child: Text("กิจกรรมวิ่งเพื่อสุขภาพ",
//                         style: TextStyle(fontSize: 20, color: Colors.white)),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(left: 60, top: 15),
//                     child: IconButton(
//                       icon: Icon(Icons.edit),
//                       onPressed: () {
//                         Navigator.push(null,MaterialPageRoute(builder: null))
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                 margin: EdgeInsets.only(right: 170, top: 5),
//                 child: Text('$now',
//                     style: TextStyle(fontSize: 10, color: Colors.white)),
//               )
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
