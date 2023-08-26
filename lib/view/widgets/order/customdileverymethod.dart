import 'package:e_commerce/controller/order/paymentmethodcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/imageassets.dart';

class CustomDileveryMetod extends GetView<PaymentMethodControllerImp> {
  const CustomDileveryMetod({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              controller.dileveryMehod("1");
            },
            child: controller.dileveryMethodV == "1"
                ? Container(
                    decoration: BoxDecoration(color: Appcolors.primarycolor, borderRadius: BorderRadius.circular(10), border: Border.all(width: 2, color: Appcolors.white)),
                    height: 160,
                    width: 150,
                    child: Column(
                      children: [
                        Image.asset(
                          Appimageassets.delivery,
                          color: Appcolors.white,
                        ),
                        const Text(
                          "Dilevery",
                          style: TextStyle(color: Appcolors.white, fontSize: 20),
                        )
                      ],
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(width: 2, color: Appcolors.primarycolor)),
                    height: 160,
                    width: 150,
                    child: Column(
                      children: [
                        Image.asset(
                          Appimageassets.delivery,
                        ),
                        const Text("Dilevery", style: TextStyle(color: Appcolors.primarycolor, fontSize: 20))
                      ],
                    ),
                  ),
          ),
          const SizedBox(width: 45),
          InkWell(
            onTap: () {
              controller.dileveryMehod("0");
            },
            child: controller.dileveryMethodV == "0"
                ? Container(
                    decoration: BoxDecoration(color: Appcolors.primarycolor, borderRadius: BorderRadius.circular(10), border: Border.all(width: 2, color: Appcolors.white)),
                    height: 160,
                    width: 150,
                    child: Column(
                      children: [
                        Image.asset(
                          Appimageassets.deliverythru,
                          color: Appcolors.white,
                        ),
                        const Text(
                          "Drive Thru",
                          style: TextStyle(color: Appcolors.white, fontSize: 20),
                        )
                      ],
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(width: 2, color: Appcolors.primarycolor)),
                    height: 160,
                    width: 150,
                    child: Column(
                      children: [
                        Image.asset(
                          Appimageassets.deliverythru,
                        ),
                        const Text("Drive Thru", style: TextStyle(color: Appcolors.primarycolor, fontSize: 20))
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
