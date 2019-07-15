import 'dart:async';

class Validators {
  final validatorEnrollment = StreamTransformer<String, String>.fromHandlers(
    handleData: (enrollment, sink) {
      int parse = int.tryParse(enrollment);
      if (enrollment.length >= 5) {
        if (parse != null) {
          sink.add(enrollment);
        } else {
          sink.addError('solo digitos');
        }
      } else {
        sink.addError('minimo de 5 digitos');
      }
    }
  );
}
