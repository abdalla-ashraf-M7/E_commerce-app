import 'package:e_commerce/controller/cart/cartcontroller.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/core/functions/vaildator.dart';
import 'package:e_commerce/view/widgets/authwidgets/customtextformauth.dart';
import 'package:e_commerce/view/widgets/cart/custombuttomcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationCart extends StatelessWidget {
  const CustomBottomNavigationCart({super.key, required this.text, required this.icon, this.ontap, required this.databasetotalprice, required this.shipping});
  final String text;
  final IconData icon;
  final double databasetotalprice;
  final double shipping;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    CartControllerImp controller = Get.put(CartControllerImp());
    double priceafterdiscountAndcopoun = controller.databaseCartTatalpriceAfterDiscount - (controller.databaseCartTatalpriceAfterDiscount * controller.copoundiscount / 100);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        !controller.isCopounValid
            ? Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Form(
                        key: controller.copounkey,
                        child: CustomTextFormAuth(
                          valid: (val) {
                            return ValidInput(val!, 3, 50, "else");
                          },
                          isreadonly: controller.data.isEmpty,
                          hint: "Enter a Copoun",
                          label: "Copoun",
                          textformcontroller: controller.copouncontroller!,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    if (!controller.data.isEmpty)
                      Expanded(
                          flex: 1,
                          child: CustomBUttonCart(
                              text: "Check",
                              press: () {
                                controller.getCopoun(controller.copouncontroller!.text);
                              })),
                  ],
                ))
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text(
                        "Copoun:",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Container(
                      child: Text(
                        "${controller.copounModel!.copounName} (${controller.copounModel!.copounDiscount}%)",
                        style: const TextStyle(fontSize: 30, color: Appcolors.primarycolor),
                      ),
                    ),
                  ],
                ),
              ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: Appcolors.primarycolor, width: 2)),
          height: 130,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Products Price",
                      style: TextStyle(fontSize: 20),
                    ),
                    //************************************************************ */
                    controller.isCopounValid && !controller.data.isEmpty
                        ? controller.databaseCartTatalprice == controller.databaseCartTatalpriceAfterDiscount
                            ? Row(
                                children: [
                                  Text(
                                    "${controller.databaseCartTatalprice} \$",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(decoration: TextDecoration.lineThrough, decorationThickness: 2, decorationColor: Appcolors.primarycolor, fontSize: 20),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "$priceafterdiscountAndcopoun \$",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 25, color: Appcolors.secondarycolor),
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                  Text(
                                    "${controller.databaseCartTatalprice} \$",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(decoration: TextDecoration.lineThrough, decorationThickness: 2, decorationColor: Appcolors.primarycolor, fontSize: 20),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "${controller.databaseCartTatalpriceAfterDiscount} \$",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(decoration: TextDecoration.lineThrough, decorationThickness: 2, decorationColor: Appcolors.primarycolor, fontSize: 20),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "$priceafterdiscountAndcopoun \$",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 25, color: Appcolors.secondarycolor),
                                  ),
                                ],
                              )
                        : controller.databaseCartTatalprice == controller.databaseCartTatalpriceAfterDiscount
                            ? Text("$databasetotalprice \$", style: const TextStyle(fontSize: 20))
                            : Row(
                                children: [
                                  Container(
                                    //color: Colors.amber,
                                    alignment: AlignmentDirectional.bottomEnd,
                                    child: Text(
                                      "${controller.databaseCartTatalprice} \$",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(decoration: TextDecoration.lineThrough, decorationThickness: 2, decorationColor: Appcolors.primarycolor, fontSize: 20),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "${controller.databaseCartTatalpriceAfterDiscount} \$",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 25, color: Appcolors.secondarycolor),
                                  )
                                ],
                              )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
                //color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Shipping",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text("$shipping %", style: const TextStyle(fontSize: 20))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Divider(thickness: 3),
              ),
              Container(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total Price", style: TextStyle(fontSize: 25)),
                    Text(
                      "${priceafterdiscountAndcopoun + (priceafterdiscountAndcopoun * shipping / 100)} \$",
                      style: const TextStyle(fontSize: 30, color: Appcolors.primarycolor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 5),
        InkWell(
          onTap: ontap,
          child: Container(
            decoration: BoxDecoration(color: Appcolors.secondarycolor, borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
            height: 50,
            width: Get.width - 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(icon, color: Appcolors.white, size: 25), const SizedBox(width: 10), Text(text, style: const TextStyle(fontSize: 25, color: Appcolors.white))],
            ),
          ),
        ),
      ],
    );
  }
}
