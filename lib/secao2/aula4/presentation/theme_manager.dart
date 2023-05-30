import 'package:flutter/material.dart';

import 'color_manager.dart';

ThemeData getApplicationTheme(){

  return ThemeData(
    //main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight:  ColorManager.primaryOpacity,
    primaryColorDark: ColorManager.darkPrimary,

    disabledColor:  ColorManager.grey1, // will be used in case of disabled button for example

    accentColor: ColorManager.grey

    //card view theme

    // app bar theme

    // button theme

    // text theme

    // input decoration theme (text form field)

  );

}
