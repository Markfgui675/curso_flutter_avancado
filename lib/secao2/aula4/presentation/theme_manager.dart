import 'package:curso_flutter_avancado/secao2/aula4/presentation/styles_manager.dart';
import 'package:curso_flutter_avancado/secao2/aula4/presentation/values_manager.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme(){

  return ThemeData(
    //main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight:  ColorManager.primaryOpacity,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor:  ColorManager.grey1, // will be used in case of disabled button for example
    // ripple color
    splashColor: ColorManager.primaryOpacity,

    accentColor: ColorManager.grey,

    //card view theme
    cardTheme:  CardTheme(
      color: ColorManager.white,
      shadowColor:  ColorManager.grey,
      elevation: AppSize.s4
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryOpacity,
      titleTextStyle: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16)
    )

    // button theme

    // text theme

    // input decoration theme (text form field)

  );

}
