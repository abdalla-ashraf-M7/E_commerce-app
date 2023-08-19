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
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(15),
      child: GetBuilder<ItemsControllerImp>(
          builder: (controller) => HandlinDataView(
                requeststat: controller.requeststate!,
                widget: ListView(
                  children: const [
                    Row(
                      children: [
                        CustomSearchWidget(hint: "Find"),
                        SizedBox(
                          width: 15,
                        ),
                        CustomIconHome(icon: Icons.notifications_active_outlined)
                      ],
                    ),
                    SizedBox(height: 20),
                    CustomListViewCatsInItems(),
                    SizedBox(height: 40),
                    CustomGridViewItems(),
                  ],
                ),
              )),
    ));
  }
}
