import 'package:flutter/material.dart';
import 'package:instrabaho/bloc/auth_toggle/auth_toggle_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instrabaho/component/loading.dart';
import 'package:instrabaho/screens/home.dart';
import 'package:instrabaho/screens/login_screen.dart';
import 'package:instrabaho/screens/register_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key, this.fromRegister});
  final bool? fromRegister;

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthToggleBloc, AuthToggleState>(
        builder: (context, state) {
          if (state is LoginScreenState) {
            return const LoginScreen();
          } else if (state is LoadingScreenState) {
            return const Loading();
          } else if (state is RegisterScreenState) {
            return const RegisterScreen();
          } else if (state is HomeScreenState) {
            return Home(
              userType: state.userType,
            );
          }
          return const Center(child: Text('Error'));
        },
      ),
    );
  }
}
