import 'package:e_commerce/core/constant/apptheme.dart';
import 'package:e_commerce/core/functions/fcmconfig.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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

  requestPerLofcation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("Warning", "You need to Open the Location Option in you phone");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("Warning", "You Can't use the app if you deny the location permission");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar("Warning", "you Deny the location ForEver");
    }
  }

  @override
  void onInit() {
    permissionNotification();
    fcmConfig();
    requestPerLofcation();
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
