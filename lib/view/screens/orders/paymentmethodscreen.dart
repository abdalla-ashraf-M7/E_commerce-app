// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/controller/order/paymentmethodcontroller.dart';
import 'package:e_commerce/core/class/handlingdatview.dart';
import 'package:e_commerce/view/widgets/authwidgets/custombuttonauth.dart';
import 'package:e_commerce/view/widgets/order/cusomchoosetitle.dart';
import 'package:e_commerce/view/widgets/address/customaddrestlist.dart';
import 'package:e_commerce/view/widgets/order/customdileverymethod.dart';
import 'package:e_commerce/view/widgets/order/custompaymentmethod.dart';
import 'package:e_commerce/view/widgets/order/customyoudonthaveaddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PaymentMethodControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Order'),
        ),
        body: GetBuilder<PaymentMethodControllerImp>(
            builder: (controller) => HandlinDataView(
                  requeststat: controller.requeststate,
                  widget: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CustomChooseTitle(text: "Choose Payment Method:"),
                        const SizedBox(height: 10),
                        CustomPaymentMethod(),
                        const SizedBox(height: 15),
                        const CustomChooseTitle(text: "Choose Dilevery Method:"),
                        const SizedBox(height: 10),
                        CustomDileveryMetod(),
                        const SizedBox(height: 15),
                        if (controller.dileveryMethodV == "1" && controller.data.isNotEmpty) CustomAddressList(),
                        if (controller.dileveryMethodV == "1" && controller.data.isEmpty) CustomYouDontHaveAddress(),
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          child: CustomButtonAuth(
                            text: "Order",
                            tap: () {
                              controller.checkOut();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )));
  }
}
