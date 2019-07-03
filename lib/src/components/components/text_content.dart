import 'package:flutter/material.dart';

class TextContent extends StatelessWidget{
  
  final text;
  final size;
  final textAlign;
  final color;
  final bool bold;
  TextContent(this.text,this.size,this.textAlign,this.color,this.bold);
  @override
  Widget build(BuildContext context) {
  if(bold == false){
    return Text(
     text,
     textAlign: textAlign,
     style:
     TextStyle(fontSize: size,fontFamily: 'Poppins',color: color));
   }else
   {
    return Text(
     text,
     textAlign: textAlign,
     style:
     TextStyle(fontSize: size,fontFamily: 'Poppins',color: color,fontWeight: FontWeight.bold));
   }
  }
}
 