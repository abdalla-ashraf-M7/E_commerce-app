import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/items/itemsdetailscontroller.dart';
import 'package:e_commerce/core/constant/applinks.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomStackItem extends GetView<ItemsDetailsControllerImp> {
  const CustomStackItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 180,
          width: double.infinity,
          decoration: const BoxDecoration(color: Appcolors.red2),
        ),
        Positioned(
          top: 50,
          child: Container(
            // color: Colors.amber,
            height: 250,
            width: 250,
            child: Hero(
              tag: "${controller.recieveditemsModel.itemsImage}",
              child: CachedNetworkImage(
                imageUrl: "${AppLinks.itmesimages}/${controller.recieveditemsModel.itemsImage}",
                fit: BoxFit.fill,
                height: double.infinity,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
