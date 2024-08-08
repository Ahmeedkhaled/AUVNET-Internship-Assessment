import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task_auvnet/constant/routes.dart';
import 'package:task_auvnet/constant/shared_pre.dart';
import 'package:task_auvnet/my_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> checkUserAndNavigate(BuildContext context) async {
    // Wait for shared preferences to be initialized
    await SharedPereferanceConstant.init();

    // Check if token exists
    var user = SharedPereferanceConstant.getData(key: "token");

    // Navigate to the appropriate screen based on user status
    if (user == null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacementNamed(MyRoute.login);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacementNamed(MyRoute.homeScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check user and navigate after a delay
    Timer(const Duration(seconds: 3), () {
      checkUserAndNavigate(context);
    });

    return Scaffold(
      backgroundColor: MyTheme.primaryColor,
      body: const Center(
        child: Text(
          "AUVNET",
          style: TextStyle(
              fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
