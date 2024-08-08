import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task_auvnet/constant/bloc_observer.dart';
import 'package:task_auvnet/constant/routes.dart';
import 'package:task_auvnet/constant/shared_pre.dart';
import 'package:task_auvnet/data/modal/respones/product_hive.dart';
import 'package:task_auvnet/my_theme.dart';
import 'package:task_auvnet/ui/auth/login/login_screen.dart';
import 'package:task_auvnet/ui/auth/register/register.dart';
import 'package:task_auvnet/ui/splash/splash_screen.dart';
import 'package:task_auvnet/ui/tabs/home/home_screen.dart';
import 'package:task_auvnet/ui/tabs/list/widget/List_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  Bloc.observer = MyBlocObserver();
  await SharedPereferanceConstant.init();

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
        MyRoute.homeScreen: (context) => const HomeScreen(),
        MyRoute.listDetailsName: (context) => const ListItemDetails(),
      },
      theme: MyTheme.myTheme,
    );
  }
}
