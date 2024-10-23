import 'package:flutter/material.dart';
import 'package:qurankareem/core/utils/resources/color_manager.dart';
import 'package:qurankareem/core/utils/resources/styles_manager.dart';
import 'package:qurankareem/core/utils/resources/values_manager.dart';

class ThemeManager {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: ColorManager.primary,
    scaffoldBackgroundColor: ColorManager.primary,
    primaryColorLight: ColorManager.primary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey,
    splashColor: ColorManager.primary,
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    iconTheme: IconThemeData(
      color: ColorManager.black,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primary,
      titleTextStyle: getRegularStyle(
        fontSize: AppSize.s16,
        color: ColorManager.white,
      ),
    ),
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white, fontSize: AppSize.s16),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(color: ColorManager.black, fontSize: AppSize.s16),
      headlineLarge: getSemiBoldStyle(color: ColorManager.black, fontSize: AppSize.s16),
      headlineMedium: getRegularStyle(color: ColorManager.black, fontSize: AppSize.s16),
      titleMedium: getMediumStyle(color: ColorManager.black, fontSize: AppSize.s16),
      titleSmall: getRegularStyle(color: ColorManager.black, fontSize: AppSize.s16),
      bodyLarge: getRegularStyle(color: ColorManager.black, fontSize: AppSize.s16),
      bodySmall: getRegularStyle(color: ColorManager.black, fontSize: AppSize.s16),
      bodyMedium: getRegularStyle(color: ColorManager.black, fontSize: AppSize.s16),
      labelSmall: getBoldStyle(color: ColorManager.primary, fontSize: AppSize.s16),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(color: ColorManager.grey, fontSize: AppSize.s16),
      labelStyle: getMediumStyle(color: ColorManager.grey, fontSize: AppSize.s16),
      errorStyle: getRegularStyle(color: ColorManager.error),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.white,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: ColorManager.darkPrimary,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorManager.darkPrimary,
    cardTheme: CardTheme(
      color: ColorManager.darkGrey,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.darkPrimary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.darkPrimary,
      titleTextStyle: getRegularStyle(fontSize: AppSize.s16, color: ColorManager.white),
    ),
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(color: ColorManager.white, fontSize: AppSize.s16),
      headlineLarge: getSemiBoldStyle(color: ColorManager.white, fontSize: AppSize.s16),
      headlineMedium: getRegularStyle(color: ColorManager.white, fontSize: AppSize.s16),
      titleMedium: getMediumStyle(color: ColorManager.white, fontSize: AppSize.s16),
      titleSmall: getRegularStyle(color: ColorManager.white, fontSize: AppSize.s16),
      bodyLarge: getRegularStyle(color: ColorManager.white, fontSize: AppSize.s16),
      bodySmall: getRegularStyle(color: ColorManager.white, fontSize: AppSize.s16),
      bodyMedium: getRegularStyle(color: ColorManager.white, fontSize: AppSize.s16),
      labelSmall: getBoldStyle(color: ColorManager.darkPrimary, fontSize: AppSize.s16),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(color: ColorManager.white, fontSize: AppSize.s16),
      labelStyle: getMediumStyle(color: ColorManager.white, fontSize: AppSize.s16),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.white, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
    iconTheme: IconThemeData(
      color: ColorManager.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.black,
    ),
  );
}
