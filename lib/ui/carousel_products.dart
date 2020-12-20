import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class CarouselProducts extends StatelessWidget {
  const CarouselProducts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget caouselImages = SizedBox(
      height: 200.0,
      child: Carousel(
        showIndicator: true,
        boxFit: BoxFit.cover,
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        indicatorBgPadding: 10.0,
        dotColor: Colors.amber,
        dotSize: 10.0,
        dotBgColor: Colors.transparent,
        images: [
          AssetImage("assets/images/bike0.jpg"),
          AssetImage("assets/images/bike1.jpg"),
          AssetImage("assets/images/bike2.jpg"),
          AssetImage("assets/images/bike0.jpg"),
          AssetImage("assets/images/bike3.jpg"),
          AssetImage("assets/images/bike4.jpg"),
          AssetImage("assets/images/bike0.jpg"),
          AssetImage("assets/images/bike5.png"),
        ],
      ),
    );

    return caouselImages;
  }
}
