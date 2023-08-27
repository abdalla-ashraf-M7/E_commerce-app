import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/view/screens/offer/offerscreen.dart';
import 'package:e_commerce/view/screens/pagesinhomescreen/home.dart';
import 'package:e_commerce/view/screens/pagesinhomescreen/settingscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changepage(int i);
  gotocart();
}

class HOmeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> pagesinhome = [
    const HomePage(),
    const Center(child: Text("Profile", style: TextStyle(color: Colors.black, fontSize: 50))),
    const OfferScreen(),
    const SettingsScreen(),
  ];
  List titlepagesinhome = [
    ["Home", "Profile", "Offer", "Settings"],
    [Icons.home, Icons.person, Icons.scale_sharp, Icons.settings]
  ];

  @override
  changepage(int i) {
    currentpage = i;
    update();
  }

  @override
  gotocart() {
    Get.toNamed(Approutes.cart);
  }
}
