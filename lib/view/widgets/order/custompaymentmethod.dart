import 'package:e_commerce/controller/order/paymentmethodcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';
import 'customcontainerwithtext.dart';

class CustomPaymentMethod extends GetView<PaymentMethodControllerImp> {
  const CustomPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              controller.paymentMethod("0");
            },
            child: controller.paymentMethodV == "0"
                ? const CustomContainerWithText(
                    words: "Cash",
                    backcolor: Appcolors.primarycolor,
                  )
                : const CustomContainerWithText(
                    words: "Cash",
                    backcolor: Appcolors.grey3,
                  ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              controller.paymentMethod("1");
            },
            child: controller.paymentMethodV == "1"
                ? const CustomContainerWithText(
                    words: "Cards",
                    backcolor: Appcolors.primarycolor,
                  )
                : const CustomContainerWithText(
                    words: "Cards",
                    backcolor: Appcolors.grey3,
                  ),
          ),
        ],
      ),
    );
  }
}
