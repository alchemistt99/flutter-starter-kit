import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginPressed extends LoginEvent {
  final String username;
  final String password;
  final String fcmToken;

  LoginPressed({
    @required this.username,
    @required this.password,
    this.fcmToken,
  });

  @override
  String toString() => 'LoginPressed';

  @override
  List<Object> get props => [username, password, fcmToken];
}
