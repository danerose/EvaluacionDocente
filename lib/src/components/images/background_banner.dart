import 'package:flutter/material.dart';

class BackgroundBanner extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/banner.png'),
        fit: BoxFit.cover
      )
     ),
    );
  }
}