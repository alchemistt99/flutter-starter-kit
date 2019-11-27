import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_starter_kit/configs/Routes.dart';
import 'package:flutter_starter_kit/constants/Navigation.dart';
import 'package:flutter_starter_kit/repositories/userRepository.dart';
import 'package:flutter_starter_kit/screens/home/homeScreen.dart';
import 'package:flutter_starter_kit/screens/login/loginScreen.dart';
import 'package:flutter_starter_kit/utilities/simpleDelegate.dart';

import 'blocs/authentication/bloc.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      builder: (context) =>
          AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatefulWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Unauthenticated) {
            return LoginScreen(
              userRepository: widget._userRepository,
            );
          } else if (state is Authenticated) {
            return HomeScreen();
          } else {
            return Container();
          }
        },
      ),
      onGenerateRoute: generateRoutes,
      navigatorKey: NavigationConstrants.navKey,
    );
  }
}
