import 'package:flutter/material.dart';

class BackgroundFooter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(
      borderRadius: BorderRadius.only(bottomLeft:Radius.circular(8.0),bottomRight:Radius.circular(8.0)),
      image: DecorationImage(
        image: AssetImage('assets/images/footer_upqroo.png'),
        fit: BoxFit.cover
      )
     ),
    );
  }
}