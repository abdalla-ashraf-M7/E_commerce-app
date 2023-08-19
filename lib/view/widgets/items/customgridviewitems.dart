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
    return GetBuilder<ItemsControllerImp>(
        builder: (controller) => GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: .7),
              itemCount: controller.pickedOne.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemsInItems(itemsModel: ItemsModel.fromJson(controller.pickedOne[index]));
              },
            ));
  }
}

class ItemsInItems extends GetView<ItemsControllerImp> {
  const ItemsInItems({
    super.key,
    required this.itemsModel,
  });
  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  child: Image.network(
                    "${AppLinks.itmesimages}/${itemsModel.itemsImage}",
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${itemsModel.itemsName}",
                  style: const TextStyle(fontSize: 23, color: Appcolors.primarycolor, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${itemsModel.itemsDesc}",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Appcolors.night2, fontSize: 16),
                ),
                const Spacer(),
                Container(
                  //  color: Colors.amber,
                  //padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${itemsModel.itemsPrice} \$",
                          style: const TextStyle(fontSize: 23, color: Appcolors.primarycolor, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.favorite_border_sharp,
                              size: 27,
                            ))
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
                    color: Appcolors.primarycolor,
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
    );
  }
}
