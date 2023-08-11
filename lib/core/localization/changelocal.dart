import 'package:e_commerce/core/constant/apptheme.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  Locale? langauge;
  MyServices myServices = Get.find();
  ThemeData apptheme = appthemeEnglish;

  changeLang(String langcode) {
    langauge = Locale(langcode);
    myServices.sharedPrefs!.setString("lang", langcode);
    apptheme = langcode == "ar" ? appthemeArabic : appthemeEnglish;
    Get.updateLocale(langauge!);
    Get.changeTheme(apptheme);
  }

  @override
  void onInit() {
    if (myServices.sharedPrefs!.getString("lang") == "ar") {
      langauge = const Locale("ar");
      apptheme = appthemeArabic;
    } else if (myServices.sharedPrefs!.getString("en") == "en") {
      langauge = const Locale("en");
      apptheme = appthemeEnglish;
    } else {
      langauge = Get.deviceLocale;
      apptheme = appthemeEnglish;
    }
    super.onInit();
  }
}
