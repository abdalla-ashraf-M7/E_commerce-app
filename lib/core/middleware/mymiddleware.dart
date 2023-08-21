import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  MyServices myServices = Get.find();
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPrefs!.getString("step") == "2") {
      return const RouteSettings(name: Approutes.homescreen);
    }
    if (myServices.sharedPrefs!.getString("step") == "1") {
      return const RouteSettings(name: Approutes.login);
    }
    //return const RouteSettings(name: Approutes.language); wronnnng
  }
}
