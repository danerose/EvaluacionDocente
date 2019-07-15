import 'package:flutter/material.dart';

class LogoUPQROO extends StatelessWidget{
  
  final int wich;
  final width;
  final height;
  LogoUPQROO(this.wich,this.width,this.height);
  
  @override
  Widget build(BuildContext context) {
    var image = AssetImage('assets/images/logo.png');
    if(wich == 2){
      image = AssetImage('assets/images/logo_white.png');
    }
    return Image(
     width: width,
     height: height,
     image: image
    );
  }
}