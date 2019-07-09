import 'package:flutter/material.dart';

class LogoUPQROO extends StatelessWidget{
  
  final int wich;
  final double width;
  final double height;
  LogoUPQROO(this.wich,this.width,this.height);
  @override
  Widget build(BuildContext context) {
    if(wich == 1){
    return Image(
     width: width,
     height: height,
     image: AssetImage('assets/images/logo_upqroo.png'),
    );
    }else{
    return Image(
     width: width,
     height: height,
     image: AssetImage('assets/images/logo_upqroo_white.png'),
    ); 
    }
  }
}