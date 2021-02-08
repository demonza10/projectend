import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queuenbuapp/navigation/nav.dart';
import 'package:queuenbuapp/providers/transaction_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider();
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Queue NBU App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BotttomNavBar(),
      ),
    );
  }
}
