import 'dart:async';
import 'package:curso_flutter_avancado/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../app/app_preferences.dart';
import '../../app/di.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/values_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  AppPreferences _appPreferences = instance<AppPreferences>();

  Timer? _timer;
  _startDelay(){
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }
  _goNext(){

    _appPreferences.isUserLoggedIn().then((isUserLoggedIn){
      if(isUserLoggedIn){
        // navigate to main screen
        Navigator.pushReplacementNamed(context, Routes.mainRoute);
      }else{
        _appPreferences.isOnBoardingScreenViewed().then((isOnBoardingScreenViewed){
          if(isOnBoardingScreenViewed){
            Navigator.pushReplacementNamed(context, Routes.loginRoute);
          }else{
            Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
          }
        });
      }
    });
    
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,

      appBar: AppBar(
        toolbarHeight: 0,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.primary,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),

      body: const Center(
        child: Image(image: AssetImage(ImageAssets.splashLogo), width: AppSize.s100,),
      ),

    );
  }
}

