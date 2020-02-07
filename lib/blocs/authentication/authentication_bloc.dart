import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_starter_kit/repositories/userRepository.dart';
import 'package:flutter_starter_kit/utilities/sharedPreferences/authPreferences.dart';
import './bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  AuthenticationState get initialState => InitialAuthenticationState();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool isToken = await AuthPreferences.isToken();

      if (isToken) {
        final record = await _userRepository.getUserInfo();
        yield Authenticated(record);
      } else {
        yield Unauthenticated();
      }
    }

    if (event is LoggedIn) {
      // AuthPreferences
      await AuthPreferences.setToken(event.token);
      try {
        final record = await _userRepository.getUserInfo(forceFetch: true);
        yield Authenticated(record);
      } catch (error) {
        yield AuthenticatedError(errors: error);
      }
    }
  }
}
