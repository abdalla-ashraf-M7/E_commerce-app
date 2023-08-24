import 'package:e_commerce/controller/pagesinhome/settingscontroller.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SettingsControllerImp());
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 2,
                width: double.infinity,
                color: Appcolors.primarycolor,
              ),
              Positioned(
                  top: Get.width / 3.1,
                  //right: Get.width / 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(5),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(Appimageassets.avatar),
                      backgroundColor: Appcolors.grey1,
                      radius: 70,
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          GetBuilder<SettingsControllerImp>(
              builder: (controller) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ...List.generate(
                            controller.listData.length,
                            (index) => Card(
                                    child: ListTile(
                                  onTap: () {
                                    index == 4
                                        ? controller.logout()
                                        : index == 1
                                            ? controller.goToAddress()
                                            : print("dfd");
                                  },
                                  contentPadding: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 8),
                                  title: Text(
                                    "${controller.listData[index]['title']}",
                                    style: const TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                  trailing: controller.listData[index]['trailling'],
                                )))
                      ],
                    ),
                  ))
        ],
      ),
    );
  }
}
