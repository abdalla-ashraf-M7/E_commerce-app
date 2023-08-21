import 'package:e_commerce/controller/fav/addanddeletefavcontroller.dart';
import 'package:e_commerce/controller/items/itemscontroller.dart';
import 'package:e_commerce/core/class/handlingdatview.dart';
import 'package:e_commerce/view/widgets/homewidgets/customiconhome.dart';
import 'package:e_commerce/view/widgets/homewidgets/customsearch.dart';
import 'package:e_commerce/view/widgets/items/customgridviewitems.dart';
import 'package:e_commerce/view/widgets/items/customlistviewcatsinitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavControllerImp controllerfav = Get.put(FavControllerImp());
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(15),
      child: GetBuilder<ItemsControllerImp>(
          builder: (controller) => HandlinDataView(
                requeststat: controller.requeststate!,
                widget: ListView(
                  children: [
                    Row(children: [
                      const CustomSearchWidget(hint: "Find"),
                      const SizedBox(width: 10),
                      CustomIconHome(
                          icon: Icons.favorite_border_outlined,
                          onpressicon: () {
                            controller.gotofavorite();
                            controllerfav.getfav();
                          }),
                      const SizedBox(width: 10),
                      const CustomIconHome(icon: Icons.notifications_active_outlined),
                    ]),
                    const SizedBox(height: 20),
                    const CustomListViewCatsInItems(),
                    const SizedBox(height: 40),
                    const CustomGridViewItems(),
                  ],
                ),
              )),
    ));
  }
}
