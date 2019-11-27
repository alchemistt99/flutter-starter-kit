import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class InitialLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  String toString() => 'LoginLoading';

  @override
  List<Object> get props => [];
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({@required this.error});

  @override
  String toString() => 'LoginFailure { error: $error }';

  @override
  List<Object> get props => [error];
}

class LoginValidationError extends LoginState {
  final Map<String, dynamic> errors;

  LoginValidationError({@required this.errors});

  @override
  String toString() => 'LoginValidationError {error: $errors}';

  @override
  List<Object> get props => [errors];
}
