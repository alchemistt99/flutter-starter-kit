import 'package:equatable/equatable.dart';
import 'package:flutter_starter_kit/models/userInfoModel.dart';
import 'package:meta/meta.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class InitialAuthenticationState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthenticationState {
  final UserInfoModel record;

  const Authenticated(this.record);

  @override
  String toString() => 'Authenticated { data user: $record }';

  @override
  List<Object> get props => [record];
}

class Unauthenticated extends AuthenticationState {
  @override
  String toString() => 'Unauthenticated';

  @override
  List<Object> get props => [];
}

class ErrorAuthenticated extends AuthenticationState {
  @override
  String toString() => 'ErrorAuthenticated';

  @override
  List<Object> get props => [];
}

class AuthenticatedError extends AuthenticationState {
  final Map<String, dynamic> errors;

  AuthenticatedError({@required this.errors});

  @override
  String toString() => 'AuthenticatedError {error: $errors}';

  @override
  List<Object> get props => [errors];
}
