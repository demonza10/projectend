import 'package:flutter/material.dart';
import 'package:queuenbuapp/screens/loginpage/login_page.dart';

import 'screens/test_screen/home_page.dart';
// import 'package:queuenbuapp/screens/homepage/Widget/home_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEU Easy.',
      home: Login(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:provider/provider.dart';
// import 'package:queuenbuapp/navigation/nav.dart';
// import 'package:queuenbuapp/providers/transaction_provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'NBUQueue',
//         theme: ThemeData(
//             primarySwatch: Colors.blue,
//             visualDensity: VisualDensity.adaptivePlatformDensity),
//         home: MyHomePage(
//           title: 'NBUQueue',
//         ));
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   // @override
//   // void iniState() {
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) {
//           return TransactionProvider();
//         })
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Queue NBU App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: BotttomNavBar(),
//       ),
//     );
//   }
// }
