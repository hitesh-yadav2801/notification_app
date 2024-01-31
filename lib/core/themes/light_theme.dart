import 'package:flutter/material.dart';
import 'package:notification_app/core/constants/my_colors.dart';

ThemeData lightMode = ThemeData(
  colorScheme: const ColorScheme.light(
    background: MyColors.white,
    primary: MyColors.primaryColor,
  ),
  brightness: Brightness.light,
);
