import 'package:e_commerce/controller/items/itemsdetailscontroller.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemsDetailsGridView extends GetView<ItemsDetailsControllerImp> {
  const CustomItemsDetailsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 1.4,
        crossAxisCount: 4,
      ),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Appcolors.night2, border: Border.all(width: 2), borderRadius: BorderRadius.circular(10)),
          child: const Text(
            "red",
            style: TextStyle(fontSize: 27, color: Appcolors.white),
          ),
        );
      },
    );
  }
}
