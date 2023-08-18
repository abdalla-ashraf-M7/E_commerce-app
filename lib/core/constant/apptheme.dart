import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';

ThemeData appthemeEnglish = ThemeData(
    fontFamily: "crimson",
    textTheme: const TextTheme(
        displayLarge: TextStyle(color: Appcolors.primarycolor, fontWeight: FontWeight.bold, fontSize: 30),
        bodyLarge: TextStyle(color: Appcolors.grey4, fontSize: 18, wordSpacing: 3, height: 1.4),
        labelLarge: TextStyle(color: Appcolors.white, fontSize: 22)));

ThemeData appthemeArabic = ThemeData(
    fontFamily: "cairo",
    textTheme: const TextTheme(
        displayLarge: TextStyle(color: Appcolors.primarycolor, fontWeight: FontWeight.bold, fontSize: 30),
        bodyLarge: TextStyle(color: Appcolors.grey4, fontSize: 18, wordSpacing: 3, height: 1.4),
        labelLarge: TextStyle(color: Appcolors.white, fontSize: 22)));
