import 'package:flutter/src/widgets/framework.dart';
import 'package:instrabaho/screens/auth_wrapper.dart';
import 'package:instrabaho/screens/home.dart';
import 'package:instrabaho/screens/introduction_screen.dart';
import 'package:instrabaho/screens/login_screen.dart';
import 'package:instrabaho/screens/register_screen.dart';

//named routes
Map<String, StatefulWidget Function(dynamic context)> routes = {
  '/': (context) => const IntroSlider(),
  '/home': (context) => const Home(),
  '/introduction_screen': (context) => const IntroSlider(),
  '/login_screen': (context) => const LoginScreen(),
  '/register_screen': (context) => const RegisterScreen(),
  '/auth_screen': (context) => const AuthenticationScreen()
};
