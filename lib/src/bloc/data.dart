import 'dart:async';
import 'package:rxdart/rxdart.dart';
//own import
import 'package:evaluacion_docente/src/bloc/validators.dart';
import 'package:evaluacion_docente/src/models/profesor_model.dart';
import 'package:evaluacion_docente/src/providers/http_provider.dart';

class DataBloc with Validators {
  //Servicio de peticiones http al back
  final _httpProvider = new HttpProvider();
  //Data de inicio, permanece el periodo y el tipo de evalucaion
  final _periodController = BehaviorSubject<String>();
  //Data del login, el enrollmente es permanente
  final _enrollmentController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  //Datos generales del usuario
  final _firstNameController = BehaviorSubject<String>();
  final _lastNameController = BehaviorSubject<String>();
  final _evalTypeController = BehaviorSubject<String>();
  final _roleController = BehaviorSubject<String>();
  //Datos de lista de maestros
  final _profesorsController = new BehaviorSubject<List<ProfesorModel>>();

  //Obtener stream periodo
  Stream<String> get periodStream => _periodController.stream;
  //Obtener stream login
  Stream<String> get enrollmentStream =>
      _enrollmentController.stream.transform(validatorEnrollment);
  Stream<String> get passwordStream => _passwordController.stream;
  //Obtener stream lista profesores
  Stream<String> get profesorsStream => _passwordController.stream;

  //Insertar valores al stream periodo
  Function(String) get changePeriod => _periodController.sink.add;
  //Insertar valores al stream login
  Function(String) get changeEnrollment => _enrollmentController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  //Insertar valores al stream datos generales
  Function(String) get changeFirstName => _firstNameController.sink.add;
  Function(String) get changeLastName => _lastNameController.sink.add;
  Function(String) get changeEvalType => _evalTypeController.sink.add;
  Function(String) get changeRole => _roleController.sink.add;
  //Insertar lista de profesores
  Function(List<ProfesorModel>) get changeProfesors =>
      _profesorsController.sink.add;

  //Obtener valor periodo
  String get period => _periodController.value;
  //Obtener valor login
  String get enrollment => _enrollmentController.value;
  String get password => _enrollmentController.value;
  //Obtener datos generales
  String get firstName => _firstNameController.value;
  String get lastName => _lastNameController.value;
  String get evalType => _evalTypeController.value;
  String get role => _roleController.value;
  //Obtener lista profesores
  List<ProfesorModel> get profesor => _profesorsController.value;

  //cerrar stream
  disposeAll() {
    _periodController?.close();
    _enrollmentController?.close();
    _firstNameController?.close();
    _lastNameController?.close();
    _evalTypeController?.close();
    _roleController?.close();
    _profesorsController?.close();
  }

  //cerrar stream password
  disposePass() {
    _passwordController?.close();
  }

  //funciones
  void loadPeriod() async {
    final period = await _httpProvider.getPeriod();
    this.changePeriod(period);
    print(this.period);
  }

  void loadProfesors() async {
    final profesors = await _httpProvider.loginNProfesors();
  }
  // Stream<bool> get validateFormLogin =>
  // Observable.combineLatest2(streamA, streamB, combiner);
}
