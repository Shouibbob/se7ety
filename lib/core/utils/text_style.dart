import 'package:flutter/material.dart';
import 'package:se7ety/core/utils/colors.dart';

TextStyle getHeadLineStyle(
    {double fontSize = 24,
    Color? color,
    fontWeight = FontWeight.bold,
    String? fontFamily}) {
  return TextStyle(
    fontFamily: fontFamily ?? 'cairo',
    color: color ?? AppColors.primaryColor,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

TextStyle getTitleStyle(
    {double fontSize = 18,
    Color? color,
    fontWeight = FontWeight.bold,
    String? fontFamily}) {
  return TextStyle(
    fontFamily: fontFamily ?? 'cairo',
    color: color ?? AppColors.primaryColor,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

TextStyle getBodyStyle(
    {double fontSize = 16,
    Color? color,
    fontWeight = FontWeight.normal,
    String? fontFamily}) {
  return TextStyle(
    fontFamily: fontFamily ?? 'cairo',
    color: color ?? AppColors.textColor,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

TextStyle getSmallTextStyle(
    {double fontSize = 14,
    Color? color,
    fontWeight = FontWeight.normal,
    String? fontFamily}) {
  return TextStyle(
    fontFamily: fontFamily ?? 'cairo',
    color: color ?? AppColors.textColor,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}
