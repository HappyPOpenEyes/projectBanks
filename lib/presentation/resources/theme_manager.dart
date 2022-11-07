import 'package:flutter/material.dart';
import 'package:project_bank/presentation/resources/styles_manager.dart';
import 'package:project_bank/presentation/resources/value_manager.dart';

import 'color_manager.dart';
import 'fontManager.dart';

ThemeData getApllicationTheme(){
  return ThemeData(
    // main color of the app
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primaryWithOpacity,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1, // will be used incase of disabled button for example
      accentColor: ColorManager.gray,
      splashColor: ColorManager.primaryWithOpacity,

      // card view theme

      cardTheme: CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.gray,
          elevation: AppSize.s4),

      // app bar theme
      appBarTheme: AppBarTheme(
          centerTitle: true,color: ColorManager.primary,elevation: AppSize.s4,shadowColor: ColorManager.primaryWithOpacity,titleTextStyle: (getRegularTextStyle(color: ColorManager.white,fontSize: AppSize.s16))
      ),

      //button theme

      buttonTheme: ButtonThemeData(
          shape: StadiumBorder(),disabledColor: ColorManager.grey1,buttonColor: ColorManager.primary,splashColor: ColorManager.primaryWithOpacity,highlightColor: Colors.green
      ),

      // Elevated Button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularTextStyle(color: ColorManager.white),
              primary: ColorManager.primary,
              //shape: RoundedRectangleBorder(
               //   borderRadius: BorderRadius.circular(AppSize.s12)
              //   )
                )
                ),

      //text theme
      textTheme: TextTheme(
          headline1: getSemiBoldTextStyle(color: ColorManager.darkGray,fontSize: AppSize.s16),
          headlineLarge: getBoldTextStyle(color: ColorManager.darkGray,fontSize: AppSize.s20),
          headline2: getRegularTextStyle(
              color: ColorManager.white, fontSize: FontSize.s16),
          headline3: getBoldTextStyle(
              color: ColorManager.primary, fontSize: FontSize.s16),
          headline4: getRegularTextStyle(
              color: ColorManager.primary, fontSize: FontSize.s14),
          subtitle1: getMediumTextStyle(color: ColorManager.black,fontSize: AppSize.s14),
          subtitle2: getMediumTextStyle(
              color: ColorManager.primary, fontSize: FontSize.s14),
          caption: getRegularTextStyle(color: ColorManager.grey1),
          bodyText1: getRegularTextStyle(color: ColorManager.gray,fontSize: AppSize.s14)
      ),
      //input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(AppPadding.p8),
        //hint Style
        hintStyle: getRegularTextStyle(color: ColorManager.grey1),
        //Label Style
        labelStyle: getRegularTextStyle(color: ColorManager.darkGray),
        //error style
        errorStyle: getRegularTextStyle(color: ColorManager.error),
        //enabled border
        // enabled border
        enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.gray, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused border
        focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

        // error border
        errorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused error border
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
      ));
}