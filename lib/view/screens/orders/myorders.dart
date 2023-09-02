import 'package:e_commerce/controller/order/myorderscontroller.dart';
import 'package:e_commerce/core/class/handlingdatview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/order/customorderlist.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyOrdersControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: GetBuilder<MyOrdersControllerImp>(
          builder: (controller) => HandlinDataView(
              requeststat: controller.requeststate,
              widget: RefreshIndicator(
                  child: ListView(
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
                  ),
                  onRefresh: () async {
                    controller.refreshMyOrderspage();
                  }))),
    );
  }
}
