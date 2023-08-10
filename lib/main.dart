import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/routes.dart';
import 'package:e_commerce/view/screens/onboardingscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          fontFamily: "crimson",
          textTheme: const TextTheme(
            displayLarge: TextStyle(color: Appcolors.primarycolor, fontWeight: FontWeight.bold, fontSize: 25),
            bodyLarge: TextStyle(color: Appcolors.grey, fontSize: 16, wordSpacing: 3, height: 1.4),
          )),
      debugShowCheckedModeBanner: false,
      home: const OnBoardingScreen(),
      getPages: routes,
    );
  }
}
