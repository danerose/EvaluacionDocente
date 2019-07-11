import 'dart:async';

class LoginBloc {
  final _enrollmentController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  //obtener valor
  Stream<String> get enrollmentStream => _enrollmentController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  //Insertar valores al stream
  Function(String) get changeEnrollment => _enrollmentController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  //cerrar stream
  dispose() {
    _enrollmentController?.close();
    _passwordController?.close();
  }
}
