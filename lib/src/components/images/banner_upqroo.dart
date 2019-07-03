import 'package:flutter/material.dart';

class BannerUPQROO extends StatelessWidget{
  
  final double width;
  final double height;
  BannerUPQROO(this.width,this.height);
  @override
  Widget build(BuildContext context) {
    return Image(
     width: width,
     height: height,
     image: AssetImage('assets/images/banner_logo.png'),
    );
  }
}