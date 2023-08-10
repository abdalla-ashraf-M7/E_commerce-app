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
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: const OnBoardingScreen(),
      getPages: routes,
    );
  }
}
