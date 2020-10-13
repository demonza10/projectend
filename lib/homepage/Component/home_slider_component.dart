import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ReviewSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget image_slider_carousel = Container(
      height: 250,
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          AssetImage('img_1.jpg'),
          AssetImage('img_2.jpg'),
          AssetImage('img_1.jpg')
        ],
        autoplay: true,
        indicatorBgPadding: 1.0,
        dotSize: 0,
      ),
    );
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            image_slider_carousel,
          ],
        ));
  }
}
