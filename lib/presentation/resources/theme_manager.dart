import 'package:curso_flutter_avancado/presentation/resources/styles_manager.dart';
import 'package:curso_flutter_avancado/presentation/resources/values_manager.dart';
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
      titleTextStyle: getRegularStyle(color: ColorManager.white, fontSize: AppSize.s16)
    ),

    // button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor:  ColorManager.primary,
      splashColor: ColorManager.primaryOpacity
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12))
      )
    ),

    // text theme
    textTheme: TextTheme(
      headline1: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s12),
      headline2: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
      headline3: getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s16),
      subtitle1: getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14),
      subtitle2: getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s14),
      caption: getRegularStyle(color: ColorManager.grey1),
      bodyText1: getRegularStyle(color: ColorManager.grey)
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),

      // hint style
      hintStyle: getRegularStyle(color: ColorManager.grey1),

      // label style
      labelStyle:  getMediumStyle(color: ColorManager.darkGrey),

      //error style
      errorStyle: getRegularStyle(color: ColorManager.error),

      // enabled border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      // focused border
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
      ),

      // error border
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
      ),

      // focused error border
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
      ),
    )

  );

}
