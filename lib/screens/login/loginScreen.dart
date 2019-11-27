import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_kit/blocs/authentication/bloc.dart';
import 'package:flutter_starter_kit/blocs/login/bloc.dart';
import 'package:flutter_starter_kit/constants/Dictionary.dart';
import 'package:flutter_starter_kit/repositories/userRepository.dart';
import 'package:package_info/package_info.dart';

import 'loginForm.dart';

class LoginScreen extends StatefulWidget {
  final UserRepository userRepository;

  LoginScreen({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserRepository get _userRepository => widget.userRepository;

// TODO: onProgress
  String _versionText = Dictionary.version;

  @override
  void initState() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() {
        _versionText = packageInfo.version != null
            ? packageInfo.version
            : Dictionary.version;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      navigationBar: CupertinoNavigationBar(
        middle: Text('Login'),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            builder: (BuildContext context) => LoginBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
              userRepository: _userRepository,
            ),
          )
        ],
        child: _buildContent(),
      ),
    );
  }

  _buildContent() {
    return Stack(
      children: <Widget>[
        // Login Form
        Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 80.0),
            child: LoginForm(),
          ),
        ),
        // Foote
      ],
    );
  }
}
