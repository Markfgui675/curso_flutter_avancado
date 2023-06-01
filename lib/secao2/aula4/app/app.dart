import 'package:curso_flutter_avancado/secao2/aula4/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import '../presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key); //default constructor

  MyApp._internal(); //private named constructor
  int appState = 0;

  static final MyApp instance = MyApp._internal(); //single instance -- singleton

  factory MyApp() => instance; //factory for the class instance

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}

