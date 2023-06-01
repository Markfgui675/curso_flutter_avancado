import 'package:curso_flutter_avancado/secao2/aula4/presentation/resources/styles_manager.dart';
import 'package:curso_flutter_avancado/secao2/aula4/presentation/resources/values_manager.dart';
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
      titleTextStyle: const TextStyle(
          fontSize: 16,
          fontFamily: 'Montserrat',
          color: Colors.white,
          fontWeight: FontWeight.w400
      )
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
        textStyle: const TextStyle(
            fontSize: 16,
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontWeight: FontWeight.w400
        ),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12))
      )
    ),

    // text theme
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 16,
          fontFamily: 'Montserrat',
          color: Color(0xff525252),
          fontWeight: FontWeight.w400
      ),
      subtitle1: TextStyle(
          fontSize: 14,
          fontFamily: 'Montserrat',
          color: Color(0xff9e9e9e),
          fontWeight: FontWeight.w500
      ),
      caption: TextStyle(
          fontSize: 14,
          fontFamily: 'Montserrat',
          color: Color(0xff707070),
          fontWeight: FontWeight.w400
      ),
      bodyText1: TextStyle(
          fontSize: 14,
          fontFamily: 'Montserrat',
          color: Color(0xff737477),
          fontWeight: FontWeight.w400
      )
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),

      // hint style
      hintStyle: const TextStyle(
          fontSize: 12,
          fontFamily: 'Montserrat',
          color: Color(0xff737477),
          fontWeight: FontWeight.w400
      ),

      // label style
      labelStyle:  const TextStyle(
          fontSize: 12,
          fontFamily: 'Montserrat',
          color: Color(0xff525252),
          fontWeight: FontWeight.w500
      ),

      //error style
      errorStyle: const TextStyle(
          fontSize: 12,
          fontFamily: 'Montserrat',
          color: Color(0xffe61f34),
          fontWeight: FontWeight.w400
      ),

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
      )
    )

  );

}
