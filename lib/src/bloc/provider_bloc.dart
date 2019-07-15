import 'package:flutter/widgets.dart';
import 'package:evaluacion_docente/src/bloc/data.dart';
export 'package:evaluacion_docente/src/bloc/data.dart';

class ProviderBloc extends InheritedWidget {
  static ProviderBloc _instancia;

  factory ProviderBloc({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = ProviderBloc._internal(key: key, child: child);
    }
    return _instancia;
  }
  ProviderBloc._internal({Key key, Widget child}) : super(key: key, child: child);

  final dataBloc = DataBloc();


  @override
  // parametro bool, true si se desea notificar el estado(datos) al arbol de widgets
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  //metodo que devuelve la instacia del provider en la screen de login
  static DataBloc data(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ProviderBloc) as ProviderBloc)
        .dataBloc;
  }
}
