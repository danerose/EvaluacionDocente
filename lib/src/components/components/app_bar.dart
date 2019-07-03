import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final double  height;
  final bool show;
  Appbar(this.text, this.show,this.height);
  @override
  Widget build(BuildContext context) {
    if (this.show) {
      return AppBar(
          title: Text('Iniciar Sesión'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(33, 182, 198, 1.0));
    } else {
      return AppBar(
          title: Text('Iniciar Sesión'),
          leading: Container(),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(33, 182, 198, 1.0));
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
