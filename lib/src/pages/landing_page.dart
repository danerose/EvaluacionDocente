import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

//Own files imports
import 'package:evaluacion_docente/src/components/index.dart';
import 'package:evaluacion_docente/src/pages/loading_page.dart';


class LandingPage extends StatefulWidget{

  State createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> with TickerProviderStateMixin {

  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    Future.delayed(
      Duration(seconds: 4),(){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder:(context) => LoadingPage()
        )
      );
     }
    );
    Future.delayed(Duration(milliseconds: 1501),(){
       controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _content(animation),
    );
  }
}

_content(animation){
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.teal,
          Colors.cyan,
        ]
      )
    ),
     child:_image(animation),
  );
}

_image(animation){
  return Center(
    child: FadeTransition(
      opacity: animation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LogoUPQROO(100.0, 100.0),
          SizedBox(height: 30),
          Hero(
            tag:'home',
            child: TextContent('UNIVERSIDAD POLITECNICA DE QUINTANA ROO', 15.0, TextAlign.center, Colors.black,true),
          ),
        ],
      )
    )
  );
}