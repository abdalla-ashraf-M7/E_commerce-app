import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/core/localization/changelocal.dart';
import 'package:e_commerce/core/localization/translation.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/routes.dart';
//import 'package:e_commerce/test.dart';
import 'package:e_commerce/view/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageController languageController = Get.put(LanguageController());
    return GetMaterialApp(
      locale: languageController.langauge,
      translations: MyTranslations(),
      theme: ThemeData(
          fontFamily: "crimson",
          textTheme: const TextTheme(
              displayLarge: TextStyle(color: Appcolors.primarycolor, fontWeight: FontWeight.bold, fontSize: 30),
              bodyLarge: TextStyle(color: Appcolors.grey, fontSize: 18, wordSpacing: 3, height: 1.4),
              labelLarge: TextStyle(color: Appcolors.white, fontSize: 22))),
      debugShowCheckedModeBanner: false,
      home: const LogInScreen(),
      //home: const Test(),
      getPages: routes,
    );
  }
}
