import 'package:curso_flutter_avancado/secao2/aula4/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,

      body: const Center(
        child: Image(image: AssetImage(ImageAssets.splashLogo),),
      ),

    );
  }
}

