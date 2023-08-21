import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/home/homecontroller.dart';
import 'package:e_commerce/core/constant/applinks.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListViewItems extends GetView<HomeControllerImp> {
  const CustomListViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 170,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.items.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 15,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return ItemsDiscountInPage(itemsDiscountModel: ItemsModel.fromJson(controller.items[index]));
        },
      ),
    );
  }
}

class ItemsDiscountInPage extends StatelessWidget {
  const ItemsDiscountInPage({super.key, required this.itemsDiscountModel});
  final ItemsModel itemsDiscountModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 140,
          width: 200,
          child: CachedNetworkImage(
            imageUrl: "${AppLinks.itmesimages}/${itemsDiscountModel.itemsImage}",
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: 160,
          width: 250,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black.withOpacity(.3),
          ),
        ),
        Positioned(
            left: 10,
            top: 10,
            child: Text(
              "${itemsDiscountModel.itemsName}",
              style: const TextStyle(color: Appcolors.white, fontSize: 25, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
