import 'package:flutter/material.dart';
import 'package:notification_app/core/constants/my_colors.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: MyColors.darkGreyColor,
  ),
  brightness: Brightness.dark,
);
