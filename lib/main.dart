import 'package:flutter/material.dart';
import 'package:task_auvnet/constant/routes.dart';
import 'package:task_auvnet/my_theme.dart';
import 'package:task_auvnet/ui/auth/login/login_screen.dart';
import 'package:task_auvnet/ui/auth/register/register.dart';
import 'package:task_auvnet/ui/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoute.splashScreen,
      routes: {
        MyRoute.login: (context) => const LoginScreen(),
        MyRoute.register: (context) => const RegisterScreen(),
        MyRoute.splashScreen: (context) => const SplashScreen(),
      },
      theme: MyTheme.myTheme,
    );
  }
}
