
import 'dart:async';

import 'package:bloc_pattern/validate.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators implements BaseBloc {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;

  
  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);
  Stream<bool> get submitCheck =>
      Observable.combineLatest2(email, password, (e, p) => true);

submit() {
    print("");
  }

@override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
  
}

abstract class BaseBloc{
  void dispose();
}