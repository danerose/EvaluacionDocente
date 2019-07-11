import 'dart:async';

class Validators {

  final validatorEnrollment = StreamTransformer<String, String>.fromHandlers(
      handleData: (enrollment, sink) {
    if (enrollment.length >= 5) {
      sink.add(enrollment);
    } else {
      sink.addError('minimo de 5 digitos');
    }
  });
  
}
