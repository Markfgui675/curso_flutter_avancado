import 'package:curso_flutter_avancado/secao2/aula4/app/app.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  void updateAppState(){
    MyApp.instance.appState = 10;
  }

  void getAppState(){
    print(MyApp.instance.appState); // 10
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
