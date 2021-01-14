import 'package:flutter/material.dart';
import 'package:queuenbuapp/profliepage/Component/img_profile.dart';
import 'package:queuenbuapp/profliepage/Widget/profile_widget.dart';
// import 'package:queuenbuapp/navigation/nav.dart';

class ActivityDEP extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // แถวบน
        Row(
          children: <Widget>[
            //1
            Container(
              height: 150,
              width: 150,
              margin: EdgeInsets.only(left: 40),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
                child: Card(
                  // color: Colors.indigoAccent[700],
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 80,
                        width: 80,
                        child: Image.asset(
                          'assets/party.png',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          "แผนกกิจกรรม\nและพัฒนานักศึกษา",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //2
            Container(
              height: 150,
              width: 150,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
                child: Card(
                  // color: Colors.indigoAccent[700],
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 80,
                        width: 80,
                        child: Image.asset(
                          'assets/sports.png',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          "แผนกวินัยและกีฬา",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        //แถวล่าง
        Row(
          children: <Widget>[
            //3
            Container(
              height: 150,
              width: 150,
              margin: EdgeInsets.only(left: 40),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
                child: Card(
                  // color: Colors.indigoAccent[700],
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 80,
                        width: 80,
                        child: Image.asset(
                          'assets/saving.png',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text("แผนกทุนการศึกษา\nและสวัสดิการ",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //4
            Container(
                height: 150,
                width: 150,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile()),
                    );
                  },
                  child: Card(
                    // color: Colors.indigoAccent[700],
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.only(top: 10),
                          child: ImageProflie(),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text("โปรไฟล์",
                              style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ],
    );
  }
}

//     return Container(
//       child: Column(children: <Widget>[
//         createDocWidget('', ''),
//         createDocWidget('', ''),
//         createDocWidget('', ''),
//         createDocWidget('', ''),
//         createDocWidget('', ''),
//       ]),
//     );
//   }
// }

// Container createDocWidget(String imgName, String title) {
//   return Container(
//     child: InkWell(
//       child: Container(
//         height: 90,
//         margin: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(12)),
//           color: Colors.indigoAccent[700],
//         ),
//       ),
//     ),
//   );
// }

//  child: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//  )
