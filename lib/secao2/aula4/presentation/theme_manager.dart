import 'package:curso_flutter_avancado/secao2/aula4/presentation/values_manager.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';

ThemeData getApplicationTheme(){

  return ThemeData(
    //main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight:  ColorManager.primaryOpacity,
    primaryColorDark: ColorManager.darkPrimary,

    disabledColor:  ColorManager.grey1, // will be used in case of disabled button for example

    accentColor: ColorManager.grey,

    //card view theme
    cardTheme:  CardTheme(
      color: ColorManager.white,
      shadowColor:  ColorManager.grey,
      elevation: AppSize.s4
    )

    // app bar theme

    // button theme

    // text theme

    // input decoration theme (text form field)

  );

}
