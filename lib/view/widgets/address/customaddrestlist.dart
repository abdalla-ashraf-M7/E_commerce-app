import 'package:e_commerce/controller/order/paymentmethodcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

class CustomAddressList extends GetView<PaymentMethodControllerImp> {
  const CustomAddressList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
          child: Text(
            "Choose Address:",
            textAlign: TextAlign.start,
            style: TextStyle(color: Appcolors.grey4, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          // color: Colors.amber,
          height: 250,
          child: ListView(
            shrinkWrap: true,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      controller.whichAddress("${controller.data[index].addressId}");
                    },
                    child: controller.whichAddressV == controller.data[index].addressId
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Card(
                              color: Appcolors.primarycolor,
                              shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
                              child: ListTile(
                                  title: Text(
                                    "${controller.data[index].addressName}",
                                    style: const TextStyle(fontSize: 22, color: Appcolors.white),
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Text(
                                        "${controller.data[index].addressCity}",
                                        style: const TextStyle(fontSize: 18, color: Appcolors.white),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "${controller.data[index].addressStreet}",
                                        style: const TextStyle(fontSize: 18, color: Appcolors.white),
                                      ),
                                    ],
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete, color: Appcolors.white),
                                  )),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Card(
                              shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
                              child: ListTile(
                                  title: Text(
                                    "${controller.data[index].addressName}",
                                    style: const TextStyle(fontSize: 25, color: Colors.black),
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Text(
                                        "${controller.data[index].addressCity}",
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "${controller.data[index].addressStreet}",
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete, color: Appcolors.grey4),
                                  )),
                            ),
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
