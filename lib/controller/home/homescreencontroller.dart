import 'package:e_commerce/core/constant/approutes.dart';
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
    const Center(child: Text("Favorite", style: TextStyle(color: Colors.black, fontSize: 50))),
    const SettingsScreen(),
  ];
  List titlepagesinhome = [
    ["Home", "Profile", "Favorite", "Settings"],
    [Icons.home, Icons.person, Icons.favorite, Icons.settings]
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
