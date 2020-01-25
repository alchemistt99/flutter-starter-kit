import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_kit/blocs/login/bloc.dart';
import 'package:flutter_starter_kit/constants/Dictionary.dart';
import 'package:flutter_starter_kit/widgets/DialogTextOnly.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginBloc _loginBloc;

  String token = 'initokennya-asdjakjdnkj';

  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      FocusScope.of(context).requestFocus(FocusNode()); // Hide Keyboard
      if (_formKey.currentState.validate()) {
        _loginBloc.add(LoginPressed(
          username: _usernameController.text,
          password: _passwordController.text,
          fcmToken: token,
        ));
      } else {
        print("Validate Error");
      }
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          showCupertinoDialog(
              context: context,
              builder: (BuildContext context) => DialogTextOnly(
                    description: state.error.toString(),
                    buttonText: "OK",
                    onOkPressed: () {
                      Navigator.of(context).pop(); // To close the dialog
                    },
                  ));

          // Scaffold.of(context).hideCurrentSnackBar();
        } else if (state is LoginLoading) {
          print('loading state LoginLoading');
          // Scaffold.of(context).showSnackBar(
          //   SnackBar(
          //     content: Row(
          //       children: <Widget>[
          //         CircularProgressIndicator(),
          //         Container(
          //           margin: EdgeInsets.only(left: 15.0),
          //           child: Text(Dictionary.loginLoading),
          //         )
          //       ],
          //     ),
          //     duration: Duration(seconds: 10),
          //   ),
          // );
        } else if (state is LoginValidationError) {
          if (state.errors.containsKey('password') &&
              state.errors['password'][0].toString().contains('salah')) {
            showCupertinoDialog(
                context: context,
                builder: (BuildContext context) => DialogTextOnly(
                      description: state.errors['password'][0].toString(),
                      buttonText: "OK",
                      onOkPressed: () {
                        Navigator.of(context).pop(); // To close the dialog
                      },
                    ));
            // Scaffold.of(context).hideCurrentSnackBar();
          } else if (state.errors.containsKey('status')) {
            showCupertinoDialog(
                context: context,
                builder: (BuildContext context) => DialogTextOnly(
                      description: state.errors['status'][0].toString(),
                      buttonText: "OK",
                      onOkPressed: () {
                        Navigator.of(context).pop(); // To close the dialog
                      },
                    ));
            // Scaffold.of(context).hideCurrentSnackBar();
          }
        } else {
          // Scaffold.of(context).hideCurrentSnackBar();
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        bloc: _loginBloc,
        builder: (
          BuildContext context,
          LoginState state,
        ) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 80.0,
                  child: Image.asset(
                    'assets/images/logo/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 20.0),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        CupertinoTextField(
                          controller: _usernameController,
                          prefix: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              CupertinoIcons.person,
                            ),
                          ),
                          obscureText: false,
                          autofocus: true,
                          placeholder: Dictionary.labelUsername,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                              color: CupertinoColors.activeBlue,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        CupertinoTextField(
                          controller: _passwordController,
                          obscureText: true,
                          placeholder: Dictionary.labelPassword,
                          prefix: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              CupertinoIcons.padlock,
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                              color: CupertinoColors.activeBlue,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        CupertinoButton.filled(
                          child: Text(Dictionary.loginButton),
                          onPressed: state is! LoginLoading
                              ? _onLoginButtonPressed
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _loginBloc.close();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
