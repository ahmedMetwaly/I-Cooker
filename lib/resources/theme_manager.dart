import "package:flutter/material.dart";
import "package:the_cooker/resources/colors_manager.dart";
import "package:the_cooker/resources/constatns_manager.dart";
import "package:the_cooker/resources/style_manager.dart";
import "package:the_cooker/resources/values_manager.dart";

ThemeData getLightTheme() {
  return ThemeData(
    indicatorColor: ColorsManager.lightTextColor,
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: ColorsManager.lightPrimeColor,
      onPrimary:
          ColorsManager.lightPrimeColor.withOpacity(ConstantsManager.opicity),
      secondary: ColorsManager.lightWhiteColor,
      onSecondary:
          ColorsManager.lightWhiteColor.withOpacity(ConstantsManager.opicity),
      error: ColorsManager.lightErrorColor,
      onError:
          ColorsManager.lightErrorColor.withOpacity(ConstantsManager.opicity),
      background: ColorsManager.lightWhiteColor,
      onBackground:
          ColorsManager.lightWhiteColor.withOpacity(ConstantsManager.opicity),
      surface: ColorsManager.lightTextColor,
      onSurface: ColorsManager.lightPrimeColor,
    ),
    appBarTheme: AppBarTheme(
      elevation: 4.0,
      color: ColorsManager.lightWhiteColor,
      titleTextStyle: getBoldCairoStyle(),
      iconTheme:
          const IconThemeData(color: ColorsManager.lightTextColor, size: 30),
    ),
    textTheme: TextTheme(
      displayLarge: getBoldCairoStyle(),
      displayMedium: getLightCairoStyle(),
      displaySmall: getSemiLightCairoStyle(),
      bodyLarge: getBoldRobotoStyle(),
      bodyMedium: getRegularRobotoStyle(),
      bodySmall: getCaptionCairoStyle(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(ColorsManager.lightPrimeColor),
    )),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(PaddingManager.p8),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ConstantsManager.borderRadiusCard),
        borderSide: BorderSide(
            width: ConstantsManager.widthOfBorder,
            color: ColorsManager.lightTextColor
                .withOpacity(ConstantsManager.opicity)),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(ConstantsManager.borderRadiusCard),
          borderSide: BorderSide(
              width: ConstantsManager.widthOfBorder,
              color: ColorsManager.lightTextColor
                  .withOpacity(ConstantsManager.opicity))),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ConstantsManager.borderRadiusCard),
        borderSide: const BorderSide(
          width: ConstantsManager.widthOfBorder,
          color: ColorsManager.lightPrimeColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ConstantsManager.borderRadiusCard),
        borderSide: const BorderSide(
          width: ConstantsManager.widthOfBorder,
          color: ColorsManager.lightErrorColor,
        ),
      ),
      hintStyle: getCaptionCairoStyle().copyWith(
          color: ColorsManager.lightTextColor
              .withOpacity(ConstantsManager.opicity)),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 50,
      backgroundColor:  ColorsManager.lightTextColor,
      selectedIconTheme: IconThemeData(
          color: ColorsManager.lightPrimeColor, size: SizeManager.s30),
      selectedLabelStyle: TextStyle(color: ColorsManager.lightPrimeColor),
      selectedItemColor: ColorsManager.lightPrimeColor,
    ),
  );
}
