import 'package:flutter/material.dart';
import 'package:the_cooker/resources/colors_manager.dart';
import 'package:the_cooker/resources/fonts_manager.dart';

TextStyle getTheme(
    String fontFamily, double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    color: color,
    fontFamily: fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

// stylse for cairo font 
TextStyle getSemiLightCairoStyle() {
  return getTheme(FontFaimlyManager.cairo, FontSizeManager.fs18,
      FontWeightManager.semiLight, ColorsManager.lightTextColor);
}
TextStyle getLightCairoStyle() {
  return getTheme(FontFaimlyManager.cairo, FontSizeManager.fs18,
      FontWeightManager.light, ColorsManager.lightTextColor);
}
TextStyle getRegularCairoStyle() {
  return getTheme(FontFaimlyManager.cairo, FontSizeManager.fs18,
      FontWeightManager.regular, ColorsManager.lightTextColor);
}
TextStyle getBoldCairoStyle() {
  return getTheme(FontFaimlyManager.cairo, FontSizeManager.fs22,
      FontWeightManager.bold, ColorsManager.lightTextColor);
}
TextStyle getMaxBoldCairoStyle() {
  return getTheme(FontFaimlyManager.cairo, FontSizeManager.fs26,
      FontWeightManager.maxWeight, ColorsManager.lightTextColor);
}
TextStyle getCaptionCairoStyle() {
  return getTheme(FontFaimlyManager.cairo, FontSizeManager.fs16,
      FontWeightManager.regular, ColorsManager.lightTextColor.withOpacity(0.4));
}


// stylse for roboto font 
TextStyle getLightRobotStyle() {
  return getTheme(FontFaimlyManager.roboto, FontSizeManager.fs18,
      FontWeightManager.light, ColorsManager.lightTextColor);
}
TextStyle getRegularRobotoStyle() {
  return getTheme(FontFaimlyManager.roboto, FontSizeManager.fs18,
      FontWeightManager.regular, ColorsManager.lightTextColor);
}
TextStyle getBoldRobotoStyle() {
  return getTheme(FontFaimlyManager.roboto, FontSizeManager.fs20,
      FontWeightManager.bold, ColorsManager.lightTextColor);
}
TextStyle getMaxBoldRobotStyle() {
  return getTheme(FontFaimlyManager.roboto, FontSizeManager.fs20,
      FontWeightManager.maxWeight, ColorsManager.lightTextColor);
}
