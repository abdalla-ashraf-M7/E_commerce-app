import 'package:e_commerce/controller/order/paymentmethodcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

class CustomYouDontHaveAddress extends GetView<PaymentMethodControllerImp> {
  const CustomYouDontHaveAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        InkWell(
          onTap: () {
            controller.gotoAddNewAddress();
          },
          child: Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Appcolors.primarycolor,
              ),
              child: const Icon(
                Icons.add,
                size: 50,
                color: Appcolors.white,
              )),
        ),
        const SizedBox(height: 10),
        Container(
          child: const Text(
            "You don't have any addresses, Please add one",
            style: TextStyle(fontSize: 20, color: Appcolors.night2),
          ),
        ),
      ],
    );
  }
}
