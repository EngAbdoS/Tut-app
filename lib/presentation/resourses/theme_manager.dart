import 'package:flu_proj/presentation/resourses/color_manager.dart';
import 'package:flu_proj/presentation/resourses/font_manager.dart';
import 'package:flu_proj/presentation/resourses/styles_manager.dart';
import 'package:flu_proj/presentation/resourses/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.gray1,
    splashColor: ColorManager.lightPrimary,
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.gray,
      elevation: AppSize.s4,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
    ),
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.gray1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSize.s17,
        ),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: getSemiBoldStyle(
          color: ColorManager.darkPrimary, fontSize: FontSize.s16),
      headlineMedium:
          getRegularStyle(color: ColorManager.darkGray, fontSize: FontSize.s14),
      titleLarge:
          getMeduimStyle(color: ColorManager.lightGray, fontSize: AppSize.s14),
      titleMedium:
          getMeduimStyle(color: ColorManager.primary, fontSize: FontSize.s16),
      titleSmall:
          getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
      labelSmall:
          getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s12),
      bodyLarge: getRegularStyle(color: ColorManager.gray1),
      bodySmall: getRegularStyle(color: ColorManager.gray),
      bodyMedium: getRegularStyle(color: ColorManager.gray2,fontSize: FontSize.s12),
      displayLarge: getSemiBoldStyle(
          color: ColorManager.darkGray, fontSize: FontSize.s16),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle:
          getRegularStyle(color: ColorManager.gray, fontSize: FontSize.s14),
      labelStyle:
          getMeduimStyle(color: ColorManager.gray, fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.error),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.gray, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
    ),
  );
}
