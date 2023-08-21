import 'package:e_commerce/controller/items/itemsdetailscontroller.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRowAddAndDeleteAndPrice extends GetView<ItemsDetailsControllerImp> {
  const CustomRowAddAndDeleteAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.remove,
              color: Appcolors.red2,
              size: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(width: 2, color: Appcolors.night2)),
              alignment: AlignmentDirectional.center,
              height: 50,
              width: 50,
              child: const Text(
                "1",
                style: TextStyle(fontSize: 20, color: Appcolors.night2),
              ),
            ),
            const Icon(
              Icons.add,
              color: Appcolors.red2,
              size: 30,
            ),
          ],
        ),
        Text(
          "${controller.recieveditemsModel.itemsPrice} \$",
          style: const TextStyle(fontSize: 30, color: Appcolors.red2, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
