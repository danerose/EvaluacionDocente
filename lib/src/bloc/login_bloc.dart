import 'dart:async';
//own import
import 'package:evaluacion_docente/src/bloc/validators.dart';

class LoginBloc with Validators {

  final _enrollmentController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();
  //obtener valor
  Stream<String> get enrollmentStream => _enrollmentController.stream;
  Stream<String> get passwordStream => _passwordController.stream.transform(validatorEnrollment);
  //Insertar valores al stream
  Function(String) get changeEnrollment => _enrollmentController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  //cerrar stream
  dispose() {
    _enrollmentController?.close();
    _passwordController?.close();
  }

}
