import 'package:curso_flutter_avancado/app/di.dart';
import 'package:curso_flutter_avancado/presentation/forgot_pasword/forgot_password.dart';
import 'package:curso_flutter_avancado/presentation/login/login.dart';
import 'package:curso_flutter_avancado/presentation/main/main_view.dart';
import 'package:curso_flutter_avancado/presentation/onboarding/onboarding.dart';
import 'package:curso_flutter_avancado/presentation/resources/strings_manager.dart';
import 'package:curso_flutter_avancado/presentation/splash/splash.dart';
import 'package:curso_flutter_avancado/presentation/store/store_details.dart';
import 'package:flutter/material.dart';

import '../register/register.dart';

class Routes{

  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onboarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";

}

class RouteGenerator{

  static Route<dynamic> getRoute(RouteSettings routeSettings){

    switch(routeSettings.name){

      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());

      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingView());

      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginView());

      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());

      case Routes.forgotPasswordRoute:
        initForgotPasswordModule();
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());

      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainView());

      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => StoreDetailsView());

      default:
        return unDefinedRoute();

    }

  }

  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_){

      return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      );

    });
  }

}
