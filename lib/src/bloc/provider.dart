import 'package:flutter/widgets.dart';
import 'package:evaluacion_docente/src/bloc/login_bloc.dart';
export 'package:evaluacion_docente/src/bloc/login_bloc.dart';


class Provider extends InheritedWidget {

  final loginBloc = LoginBloc();

  Provider({Key key, Widget child}) : super(key: key, child: child); 

  @override
  // parametro bool, true si se desea notificar el estado(datos) al arbol de widgets
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  //metodo que devuelve la instacia del provider en la screen de login
  static LoginBloc login(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).loginBloc;
  }
}
