import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/background_xs.png'),
        fit: BoxFit.cover
      )
     ),
    );
  }
}

