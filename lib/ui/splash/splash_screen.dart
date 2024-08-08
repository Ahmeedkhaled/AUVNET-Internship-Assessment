import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_auvnet/constant/routes.dart';
import 'package:task_auvnet/my_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(MyRoute.register);
    });
    return Scaffold(
      backgroundColor: MyTheme.primaryColor,
      body: const Center(
          child: Text(
        "AUVNET",
        style: TextStyle(
            fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
      )),
    );
  }
}
