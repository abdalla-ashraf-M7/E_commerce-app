import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/cart/cartcontroller.dart';
import 'package:e_commerce/core/constant/applinks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

class CustomCardCart extends StatelessWidget {
  const CustomCardCart({super.key, required this.imagename, required this.itemname, required this.itemprice, required this.itemcount, this.ontapadd, this.ontapdelete, required this.i});
  final String imagename;
  final String itemname;
  final String itemprice;
  final int itemcount;
  final int i;
  final void Function()? ontapadd;
  final void Function()? ontapdelete;
  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return GetBuilder<CartControllerImp>(
        builder: (controller) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 110,
                width: double.infinity,
                child: Card(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: SizedBox(
                              height: double.infinity,
                              //color: Colors.red,
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl: "${AppLinks.itmesimages}/$imagename",
                              ))),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          //color: Colors.amber,
                          height: double.infinity,
                          child: ListTile(
                            title: Container(
                              margin: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: Text(
                                itemname,
                                style: const TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            subtitle: Container(
                              //color: Colors.black,
                              margin: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: controller.data[i].itemtotalpriceAfterdiscount == controller.data[i].itemtotalprice
                                  ? Text(
                                      itemprice,
                                      style: const TextStyle(fontSize: 20),
                                    )
                                  : Row(
                                      // mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          child: Text(
                                            "${controller.data[i].itemtotalprice} \$",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              decoration: TextDecoration.lineThrough,
                                              decorationColor: Appcolors.primarycolor,
                                              decorationThickness: 2,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          "${controller.data[i].itemtotalpriceAfterdiscount} \$",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 23, color: Appcolors.primarycolor),
                                        )
                                      ],
                                    ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 20,
                          top: 5,
                          bottom: 2,
                        ),
                        // color: Colors.brown,
                        child: SizedBox(
                          height: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(onTap: ontapadd, child: Icon(Icons.add)),
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: Text(
                                  "${itemcount}",
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              InkWell(onTap: ontapdelete, child: Icon(Icons.remove)),
                              /* Container(
                                child: IconButton(isSelected: false, onPressed: ontapdelete, icon: Icon(Icons.remove)),
                              ) */
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
