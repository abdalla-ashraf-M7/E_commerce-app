import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/fav/addanddeletefavcontroller.dart';
import 'package:e_commerce/controller/items/itemscontroller.dart';
import 'package:e_commerce/core/constant/applinks.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomGridViewItems extends StatelessWidget {
  const CustomGridViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    FavControllerImp controllerfav = Get.put(FavControllerImp());
    Get.put(ItemsControllerImp());

    return GetBuilder<ItemsControllerImp>(
        builder: (controller) => GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: .65),
              itemCount: controller.pickedOne.length,
              itemBuilder: (BuildContext context, int index) {
                controllerfav.isfav[controller.pickedOne[index]['items_id']] = controller.pickedOne[index]['favs'];
                return ItemsInItems(
                  itemsModel: ItemsModel.fromJson(controller.pickedOne[index]),
                  i: index,
                );
              },
            ));
  }
}

class ItemsInItems extends GetView<ItemsControllerImp> {
  const ItemsInItems({
    super.key,
    required this.itemsModel,
    required this.i,
  });
  final ItemsModel itemsModel;
  final int i;

  @override
  Widget build(BuildContext context) {
    int itempriceIntForm = int.parse("${itemsModel.itemsPrice}");
    int itemDiscountIntForm = int.parse("${itemsModel.itemsDiscount}");
    Get.put(FavControllerImp());
    return InkWell(
      onTap: () {
        controller.gotoitemsdetails(itemsModel);
      },
      child: Stack(
        children: [
          Card(
            child: Container(
              //color: Colors.red,
              padding: const EdgeInsets.only(top: 10, right: 5, left: 5, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    width: 150,
                    //color: Colors.red,
                    child: Hero(
                      tag: "${itemsModel.itemsImage}",
                      child: CachedNetworkImage(
                        imageUrl: "${AppLinks.itmesimages}/${itemsModel.itemsImage}",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${itemsModel.itemsName}",
                    style: const TextStyle(fontSize: 23, color: Appcolors.primarycolor, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.timer_outlined),
                      SizedBox(width: 5),
                      Text(
                        "${controller.dileverytime} minutes",
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Appcolors.grey4, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    //  color: Colors.amber,
                    //padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          itemsModel.itemsDiscount == '0'
                              ? Text(
                                  "${itemsModel.itemsPrice}\$",
                                  style: const TextStyle(fontSize: 23, color: Appcolors.primarycolor, fontWeight: FontWeight.bold),
                                )
                              : Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "${itempriceIntForm - (itempriceIntForm * itemDiscountIntForm / 100)}\$",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 23, color: Appcolors.primarycolor, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      // color: Colors.amber,
                                      //alignment: AlignmentDirectional.bottomEnd,
                                      child: Text(
                                        "${itemsModel.itemsPrice}\$",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(decoration: TextDecoration.lineThrough, decorationThickness: 2, decorationColor: Appcolors.primarycolor, fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                          //******************************************************** */
                          GetBuilder<FavControllerImp>(
                            builder: (controller) => InkWell(
                                onTap: () {
                                  if (controller.isfav[itemsModel.itemsId] == '1') {
                                    controller.setfav("${itemsModel.itemsId}", '0');
                                    controller.deletefav(itemsModel.itemsId!);
                                  } else if (controller.isfav[itemsModel.itemsId] == '0') {
                                    controller.setfav("${itemsModel.itemsId}", '1');
                                    controller.addfav(itemsModel.itemsId!);
                                  }
                                  print(controller.isfav);
                                },
                                child: controller.isfav[itemsModel.itemsId] == '1'
                                    ? const Icon(
                                        Icons.favorite,
                                        size: 27,
                                        color: Appcolors.orange1,
                                      )
                                    : const Icon(
                                        Icons.favorite_border_outlined,
                                        size: 27,
                                      )),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          itemsModel.itemsDiscount != "0"
              ? Positioned(
                  top: -10,
                  left: -10,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Appcolors.orange1,
                      shape: BoxShape.circle,
                    ),
                    height: 50,
                    width: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 17),
                      child: Text(
                        "${itemsModel.itemsDiscount}%",
                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Appcolors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
