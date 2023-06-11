import 'package:curso_flutter_avancado/app/app.dart';
import 'package:curso_flutter_avancado/app/di.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}
