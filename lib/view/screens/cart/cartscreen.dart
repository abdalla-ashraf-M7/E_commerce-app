import 'package:e_commerce/controller/cart/cartcontroller.dart';
import 'package:e_commerce/core/class/handlingdatview.dart';
import 'package:e_commerce/view/widgets/cart/customappbarcart.dart';
import 'package:e_commerce/view/widgets/cart/customcardcart.dart';
import 'package:e_commerce/view/widgets/cart/customnavigationbarcart.dart';
import 'package:e_commerce/view/widgets/cart/customnumberofcarts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return Scaffold(
        bottomNavigationBar: GetBuilder<CartControllerImp>(
            builder: (controller) => HandlinDataView(
                requeststat: controller.requeststate,
                widget: CustomBottomNavigationCart(text: "Place Order", icon: Icons.outbond_rounded, databasetotalprice: controller.databaseCartTatalprice, shipping: 10))),
        // ),
        body: GetBuilder<CartControllerImp>(
          builder: (controller) => ListView(
            children: [
              const SizedBox(height: 10),
              CustomAppBarCart(onTabBackIcon: () {
                Get.back();
              }),
              const SizedBox(height: 10),
              CustomNumberOfCart(
                numberofcart: 'You have ${controller.databaseCartCount} products in your Cart',
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomCardCart(
                      ontapadd: () async {
                        await controller.addcart("${controller.data[index].itemsId}");
                        controller.refreshcart();
                      },
                      ontapdelete: () async {
                        await controller.deletecart("${controller.data[index].itemsId}");
                        controller.refreshcart();
                      },
                      imagename: "${controller.data[index].itemsImage}",
                      itemname: "${controller.data[index].itemsName}",
                      itemprice: "${controller.data[index].itemsPrice}",
                      itemcount: int.parse("${controller.data[index].itemcount}"));
                },
              ),
            ],
          ),
        ));
  }
}
