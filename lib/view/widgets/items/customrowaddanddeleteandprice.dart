import 'package:e_commerce/controller/items/itemsdetailscontroller.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRowAddAndDeleteAndPrice extends GetView<ItemsDetailsControllerImp> {
  const CustomRowAddAndDeleteAndPrice({
    super.key,
    this.ontapadd,
    this.ontapdelete,
  });
  final void Function()? ontapadd;
  final void Function()? ontapdelete;

  @override
  Widget build(BuildContext context) {
    int itempriceIntForm = int.parse("${controller.recieveditemsModel.itemsPrice}");
    int itemDiscountIntForm = int.parse("${controller.recieveditemsModel.itemsDiscount}");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: ontapdelete,
              child: const Icon(
                Icons.remove,
                color: Appcolors.red2,
                size: 30,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(width: 2, color: Appcolors.night2)),
              alignment: AlignmentDirectional.center,
              height: 50,
              width: 50,
              child: Text(
                "${controller.cartcount}",
                style: const TextStyle(fontSize: 20, color: Appcolors.night2),
              ),
            ),
            InkWell(
              onTap: ontapadd,
              child: const Icon(
                Icons.add,
                color: Appcolors.red2,
                size: 30,
              ),
            ),
          ],
        ),
        controller.recieveditemsModel.itemsDiscount == '0'
            ? Text(
                "${controller.recieveditemsModel.itemsPrice} \$",
                style: const TextStyle(fontSize: 30, color: Appcolors.red2, fontWeight: FontWeight.bold),
              )
            : Row(
                children: [
                  Container(
                    //color: Colors.amber,
                    //alignment: AlignmentDirectional.bottomEnd,
                    child: Text(
                      "${controller.recieveditemsModel.itemsPrice} \$",
                      textAlign: TextAlign.center,
                      style: const TextStyle(decoration: TextDecoration.lineThrough, decorationThickness: 2, decorationColor: Appcolors.primarycolor, fontSize: 25),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "${itempriceIntForm - (itempriceIntForm * itemDiscountIntForm / 100)} \$",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 30, color: Appcolors.primarycolor, fontWeight: FontWeight.bold),
                  )
                ],
              )
      ],
    );
  }
}
