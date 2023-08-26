import 'package:e_commerce/controller/order/paymentmethodcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

class CustomChooseTitle extends GetView<PaymentMethodControllerImp> {
  const CustomChooseTitle({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topStart,
      child: Text(
        text,
        style: TextStyle(color: Appcolors.grey4, fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}
