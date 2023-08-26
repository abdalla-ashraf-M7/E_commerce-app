import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/view/widgets/defaultdialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController {
  logout();
  goToAddress();
  goToOrders();
  goToArchive();
}

class SettingsControllerImp extends SettingsController {
  MyServices myServices = Get.find();
  List listData = [
    {
      "title": "Disable Noifications",
      "trailling": Switch(value: true, onChanged: (val) {}),
    },
    {
      "title": "Orders",
      "trailling": const Icon(Icons.earbuds_battery_outlined),
    },
    {
      "title": "Archeve",
      "trailling": const Icon(Icons.archive),
    },
    {
      "title": "Adress",
      "trailling": const Icon(Icons.location_on),
    },
    {
      "title": "About Us",
      "trailling": const Icon(Icons.info_outlined),
    },
    {
      "title": "Contact Us",
      "trailling": const Icon(Icons.phone_callback),
    },
    {
      "title": "Log out",
      "trailling": InkWell(
        child: Icon(Icons.exit_to_app),
        onTap: () {},
      ),
    },
  ];

  @override
  logout() {
    defultDialog("Waringing", "Are You Sure That You Want to Log Out", "Cancel", "Confirm", 20, 20, () {
      Get.back();
    }, () {
      myServices.sharedPrefs!.setString('step', '1');
      String id = "${myServices.sharedPrefs!.getString("id")}";
      FirebaseMessaging.instance.unsubscribeFromTopic("users");
      FirebaseMessaging.instance.unsubscribeFromTopic("users$id");
      Get.offAllNamed(Approutes.login);
    });
  }

  @override
  goToAddress() {
    Get.toNamed(Approutes.address);
  }

  @override
  goToOrders() {
    Get.toNamed(Approutes.myorders);
  }

  @override
  goToArchive() {
    Get.toNamed(Approutes.archive);
  }
}
