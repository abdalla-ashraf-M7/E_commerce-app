import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  Locale? langauge;
  MyServices myServices = Get.find();

  changeLang(String langcode) {
    langauge = Locale(langcode);
    myServices.sharedPrefs!.setString("lang", langcode);
    Get.updateLocale(langauge!);
  }

  @override
  void onInit() {
    if (myServices.sharedPrefs!.getString("lang") == "ar") {
      langauge = const Locale("ar");
    } else if (myServices.sharedPrefs!.getString("en") == "en") {
      langauge = const Locale("en");
    } else {
      langauge = Get.deviceLocale;
    }
    super.onInit();
  }
}
