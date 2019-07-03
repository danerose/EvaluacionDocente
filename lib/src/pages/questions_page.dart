import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//Own Imports
import 'package:evaluacion_docente/src/components/index.dart';

class QuestionsPage extends StatefulWidget {
  final name;
  QuestionsPage(this.name);
  @override
  State createState() => QuestionsState();
}

class QuestionsState extends State<QuestionsPage> {
  var _pageSnapping = true;
  var _horizontalDirection = true;
  var _reverse = false;
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(widget.name,_pageSnapping,_horizontalDirection,_reverse,pageController),
    );
  }
}

_body(name,_pageSnapping,_horizontalDirection,_reverse,pageController) {
  return Stack(
    fit: StackFit.expand,
    children: <Widget>[
      Hero(
        tag: 'ninguno',
        child: Container(
          color: Color.fromRGBO(33, 182, 198, 0.5),
        ),
      ),
      new BackgroundImage(),
      CustomScrollView(
        slivers: <Widget>[
          _sliverAppBar(name), 
          _sliverFillRemaining()
        ],
      )
    ],
  );
}

_sliverAppBar(name) {
  return SliverAppBar(
      expandedHeight: 200,
      floating: true,
      pinned: true,
      snap: true,
      flexibleSpace: _flexibleSpaceBar(name, 15.0));
}

_flexibleSpaceBar(name, size) {
  return FlexibleSpaceBar(
    title: TextContent(name, size, TextAlign.center, Colors.white, true),
    centerTitle: true,
    background: BackgroundBanner(),
  );
}

_sliverFillRemaining() {
  return SliverFillRemaining(
    child: Center(
      child: _containerContent(),
    ),
  );
}

_containerContent() {
  return Center(
    child: SingleChildScrollView(
      padding: EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _pageView(),
         
        ],
      ),
    ),
  );
}

_pageView() {
  return Container(
    height: 300.0,
    width: 300.0,
    child: PageView(
      controller: PageController(
        initialPage: 3),
      children: <Widget>[
        _getPageWidget("Page 1", Colors.amber),
        _getPageWidget("Page 2", Colors.lightBlue),
        _getPageWidget("Page 3", Colors.lime),
      ],
    ),
  );
}

_getPageWidget(text,color){
  return Container(
    color: color,
    child: Center(
      child: TextContent('Pregunta 1', 15.0,TextAlign.center,Colors.black,false),
    ),
  );
}

_pageSnappingSwitch(_pageSnapping,_horizontalDirection,_reverse,pageController,setState){
var _pageSnapping = true;
return Center(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Text("Page Snapping", style: TextStyle(fontWeight: FontWeight.bold),),
      Checkbox(value: _pageSnapping, onChanged: (pageSnappingValue) {
        setState(() {
          _pageSnapping = pageSnappingValue;
        });
      })
    ],
  ),
);
}
_directionSwitch(_pageSnapping,_horizontalDirection,_reverse,pageController,setState){
  return Center(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Text("Horizontal Direction", style: TextStyle(fontWeight: FontWeight.bold),),
      Checkbox(value: _horizontalDirection, onChanged: (direction) {
        setState(() {
          _horizontalDirection = direction;
        });
      })
    ],
  ),
);
}
_reverseSwitch(_pageSnapping,_horizontalDirection,_reverse,pageController,setState) {
  return Center(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Text("Reverse", style: TextStyle(fontWeight: FontWeight.bold),),
      Checkbox(value: _reverse, onChanged: (reverse) {
        setState(() {
          _reverse = reverse;
        });
      })
    ],
  ),
 );
}