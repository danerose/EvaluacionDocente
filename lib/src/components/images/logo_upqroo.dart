import 'package:flutter/material.dart';

class LogoUPQROO extends StatelessWidget{
  
  final double width;
  final double height;
  LogoUPQROO(this.width,this.height);
  @override
  Widget build(BuildContext context) {
    return Image(
     width: width,
     height: height,
     image: AssetImage('assets/images/logo_upqroo.png'),
    );
  }
}