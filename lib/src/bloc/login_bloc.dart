import 'dart:async';

class LoginBloc {
  final _enrollmentController = StreamController<int>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  //obtener valor
  Stream<int> get enrollment => _enrollmentController.stream;
  Stream<String> get password => _passwordController.stream;
  //Insertar valores al stream
  Function(int) get changeEnrollment => _enrollmentController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  //cerrar stream
  dispose() {
    _enrollmentController?.close();
    _passwordController?.close();
  }
}
