import 'package:flutter/material.dart';
import 'package:todo_app/ui/screens/auth/login/login.dart';
import 'package:todo_app/ui/screens/auth/register/register.dart';
import 'package:todo_app/ui/screens/home/home_screen.dart';

class RoutesManager {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String register = '/register';
  static const String login = '/login';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case register:
        return MaterialPageRoute(
          builder: (context) => const Register(),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );
    }
  }
}
