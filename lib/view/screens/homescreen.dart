import 'package:e_commerce/controller/home/homescreencontroller.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/view/widgets/homewidgets/custombottombar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HOmeScreenControllerImp());
    return GetBuilder<HOmeScreenControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(
                backgroundColor: Appcolors.primarycolor,
                child: const Icon(Icons.shopping_basket_outlined, size: 30),
                onPressed: () {
                  controller.gotocart();
                },
              ),
              bottomNavigationBar: const CustomBottomBarHome(),
              body: controller.pagesinhome[controller.currentpage],
            ));
  }
}
