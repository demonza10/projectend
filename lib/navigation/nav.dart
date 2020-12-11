import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:queuenbuapp/bookingpage/Component/booking_component.dart';
import 'package:queuenbuapp/bookingpage/Widget/booking_widget.dart';
import 'package:queuenbuapp/homepage/Widget/home_widget.dart';
import 'package:queuenbuapp/profliepage/Widget/profile_widget.dart';

class BotttomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BotttomNavBar> {
  var _page = 0;
  final pages = [HomePage(), QueuePage(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          index: 0,
          color: Colors.indigoAccent[700], //สีแทบ
          height: 50,
          buttonBackgroundColor: Colors.indigoAccent[700], //สีไอคอน
          backgroundColor: Colors.white, //สีหยดน้ำ
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 500),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          items: [
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.add_circle,
              color: Colors.white,
            ),
            Icon(
              Icons.people,
              color: Colors.white,
            ),
          ]),
      body: pages[_page],
    );
  }
}
