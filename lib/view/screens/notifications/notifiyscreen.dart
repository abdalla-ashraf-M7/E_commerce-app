import 'package:e_commerce/controller/notifications/notificationscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import '../../../core/class/handlingdatview.dart';
import '../../../core/constant/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificatinsControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifications",
        ),
      ),
      body: GetBuilder<NotificatinsControllerImp>(
          builder: (controller) => HandlinDataView(
              requeststat: controller.requeststate,
              widget: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${controller.data[index].notificationsTitle}",
                                  style: const TextStyle(fontSize: 22, color: Appcolors.pink2, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  Jiffy.parse('${controller.data[index].notificationsDate}').fromNow(),
                                  style: const TextStyle(fontSize: 18, color: Appcolors.pink2),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              "${controller.data[index].notificationsBody}",
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete, color: Appcolors.primarycolor),
                            )),
                      );
                    },
                  ),
                ),
              ))),
    );
  }
}
