import 'package:e_commerce/view/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changepage(int i);
}

class HOmeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> pagesinhome = [
    HomePage(),
    Center(child: Text("Profile", style: TextStyle(color: Colors.black, fontSize: 50))),
    Center(child: Text("Favorite", style: TextStyle(color: Colors.black, fontSize: 50))),
    Center(child: Text("Settings", style: TextStyle(color: Colors.black, fontSize: 50)))
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
}
