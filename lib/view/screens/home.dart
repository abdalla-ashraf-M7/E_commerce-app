import 'package:e_commerce/controller/home/homecontroller.dart';
import 'package:e_commerce/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("${controller.id}"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.offAllNamed(Approutes.login);
              },
              icon: Icon(Icons.login_outlined))
        ],
      ),
    );
  }
}
