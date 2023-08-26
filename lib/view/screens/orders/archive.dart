import 'package:e_commerce/controller/order/archiveordercontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/handlingdatview.dart';
import '../../widgets/order/customorderlist.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveOrderControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archive'),
      ),
      body: GetBuilder<ArchiveOrderControllerImp>(
          builder: (controller) => HandlinDataView(
              requeststat: controller.requeststate,
              widget: ListView(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.data.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 5,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return CustomCardOrders(
                        ordersModel: controller.data[index],
                        i: index,
                      );
                    },
                  ),
                ],
              ))),
    );
  }
}
