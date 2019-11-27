import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/constants/Navigation.dart';
import 'package:flutter_starter_kit/screens/home/homeScreen.dart';
import 'package:flutter_starter_kit/screens/login/loginScreen.dart';

Route generateRoutes(RouteSettings settings) {
  // getting arguments passed
  final args = settings.arguments;

  switch (settings.name) {
    case NavigationConstrants.login:
      return buildRoute(
          settings,
          LoginScreen(
            userRepository: args,
          ));
    case NavigationConstrants.home:
      return buildRoute(settings, HomeScreen());

    default:
      return null;
  }
}

MaterialPageRoute buildRoute(RouteSettings settings, Widget builder) {
  return MaterialPageRoute(
    settings: settings,
    builder: (BuildContext context) => builder,
  );
}
