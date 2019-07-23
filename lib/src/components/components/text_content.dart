import 'package:flutter/material.dart';

class TextContent extends StatelessWidget{
  
  final text;
  final size;
  final textAlign;
  final color;
  final letterSpace;
  final bold;
  TextContent(this.text,this.size,this.textAlign,this.color,this.letterSpace,this.bold,);
  @override
  Widget build(BuildContext context) {
    var weigth;
    if(bold == true ){
      weigth = FontWeight.bold;
    }else{weigth = FontWeight.normal;}
    return Text(
     text,
     textAlign: textAlign,
     style:TextStyle(
       fontSize: size,
       fontFamily: 'Poppins',
       color: color,
       letterSpacing: letterSpace,
       fontWeight: weigth
     )
    );
  }
}
 