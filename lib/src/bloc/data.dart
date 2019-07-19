import 'dart:async';
import 'package:rxdart/rxdart.dart';
//own import
import 'package:evaluacion_docente/src/bloc/validators.dart';
import 'package:evaluacion_docente/src/models/profesor_model.dart';
import 'package:evaluacion_docente/src/models/question_model.dart';
import 'package:evaluacion_docente/src/providers/http_provider.dart';

class DataBloc with Validators {
  ///Controladores de datos que manejara el usuario

  ///Servicio de peticiones http al back
  final _httpProvider = new HttpProvider();

  ///Data de inicio, permanece el periodo y el tipo de evalucaion
  final _periodController = BehaviorSubject<String>();

  ///Data del login, el enrollmente es permanente
  final _enrollmentController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  ///Datos generales del usuario
  final _firstNameController = BehaviorSubject<String>();
  final _lastNameController = BehaviorSubject<String>();
  final _evalTypeController = BehaviorSubject<String>();
  final _roleController = BehaviorSubject<String>();

  ///Datos de lista de maestros
  final _profesorsController = new BehaviorSubject<List<ProfesorModel>>();

  ///Datos de peguntas de la evaluacion
  final _questionsController = new BehaviorSubject<List<QuestionModel>>();

  ///Controlador de datos que manejara la apliacion

  ///Dato que controla animaciones de carga
  final _loadController = new BehaviorSubject<bool>();

  ///Funciones get para obtener el stream del dato (stream es un oyente)
  ///con estas funciones se trabajan los cambios de estado de la apliacion

  ///Obtener stream periodo
  Stream<String> get periodStream => _periodController.stream;

  ///Obtener stream login
  Stream<String> get enrollmentStream =>
      _enrollmentController.stream.transform(validatorEnrollment);

  ///Obtener stream login
  Stream<String> get passwordStream => _passwordController.stream;

  ///Obtener stream lista profesores
  Stream<List<ProfesorModel>> get profesorsStream =>
      _profesorsController.stream;

  ///Obtener strean de carga
  Stream<bool> get loadStream => _loadController.stream;

  ///Funcion get para agregar datos al dato

  ///Insertar valores al stream periodo
  Function(String) get changePeriod => _periodController.sink.add;

  ///Insertar valores al stream login
  Function(String) get changeEnrollment => _enrollmentController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  ///Insertar valores al stream datos generales
  Function(String) get changeFirstName => _firstNameController.sink.add;
  Function(String) get changeLastName => _lastNameController.sink.add;
  Function(String) get changeEvalType => _evalTypeController.sink.add;
  Function(String) get changeRole => _roleController.sink.add;

  ///Insertar lista de profesores
  Function(List<ProfesorModel>) get changeProfesors =>
      _profesorsController.sink.add;

  ///Insetar lista de preguntas
  Function(List<QuestionModel>) get changeQuestions =>
      _questionsController.sink.add;

  //Insertar valores al stream load
  Function(bool) get changeLoad => _loadController.sink.add;

  ///Funciones get para obtener el valor final del controlador

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
  List<ProfesorModel> get profesors => _profesorsController.value;
  //Obtener lista de preguntas
  List<QuestionModel> get questions => _questionsController.value;
  //obtener load
  bool get isLoad => _loadController.value;

  //cerrar stream
  disposeAll() {
    _periodController?.close();
    _enrollmentController?.close();
    _passwordController?.close();
    _firstNameController?.close();
    _lastNameController?.close();
    _evalTypeController?.close();
    _roleController?.close();
    _profesorsController?.close();
    _questionsController?.close();
    _loadController?.close();
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

  Future<dynamic> loadProfesors() async {
    this.changeLoad(true);
    bool res;
    List<ProfesorModel> profesorTemp = List();
    final dataProf =
        await _httpProvider.loadProfesors(this.enrollment, this.password,this.period,this.role);
    final dataQues = await _httpProvider.loadQuestions();

    if (dataProf[0] == false) {
      res = false;
    } else {
      print(dataProf);
      print("------------");
      print(dataQues);
      dataProf.forEach((profJson) {
        final temp = ProfesorModel.fromJson(profJson);
        profesorTemp.add(temp);
      });
      this.changeProfesors(profesorTemp);
      res = true;
    }
    this.changeLoad(false);
    return res;
  }
  // Stream<bool> get validateFormLogin =>
  // Observable.combineLatest2(streamA, streamB, combiner);
}
