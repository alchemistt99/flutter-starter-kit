import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_starter_kit/blocs/authentication/bloc.dart';
import 'package:flutter_starter_kit/repositories/userRepository.dart';
import 'package:flutter_starter_kit/utilities/exceptions/CustomException.dart';
import 'package:flutter_starter_kit/utilities/exceptions/ValidationException.dart';
import 'package:meta/meta.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;
  final AuthenticationBloc _authenticationBloc;

  LoginBloc(
      {@required UserRepository userRepository,
      @required AuthenticationBloc authenticationBloc})
      : assert(userRepository != null),
        _userRepository = userRepository,
        assert(userRepository != null),
        _authenticationBloc = authenticationBloc;

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginPressed) {
      yield LoginLoading();

      try {
        final token = await _userRepository.authenticate(
          username: event.username,
          password: event.password,
          fcmToken: event.fcmToken,
        );

        _authenticationBloc.add(LoggedIn(token: token));
        yield InitialLoginState();
      } on ValidationException catch (error) {
        yield LoginValidationError(errors: error.errors);
      } catch (e) {
        yield LoginFailure(
            error: CustomException.onConnectionException(e.toString()));
      }
    }
  }
}
