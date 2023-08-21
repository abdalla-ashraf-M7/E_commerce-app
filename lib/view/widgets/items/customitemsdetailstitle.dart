import 'package:e_commerce/controller/items/itemsdetailscontroller.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemDetailsTitle extends GetView<ItemsDetailsControllerImp> {
  const CustomItemDetailsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("${controller.recieveditemsModel.itemsName}", textAlign: TextAlign.start, style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Appcolors.night2));
  }
}

class CustomItemsDetailsDisc extends GetView<ItemsDetailsControllerImp> {
  const CustomItemsDetailsDisc({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "${controller.recieveditemsModel.itemsDesc}${controller.recieveditemsModel.itemsDesc}${controller.recieveditemsModel.itemsDesc}${controller.recieveditemsModel.itemsDesc}${controller.recieveditemsModel.itemsDesc}${controller.recieveditemsModel.itemsDesc}${controller.recieveditemsModel.itemsDesc}",
      style: const TextStyle(color: Appcolors.night2, fontSize: 18),
    );
  }
}
