import 'package:e_commerce/controller/items/itemsdetailscontroller.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/view/widgets/items/custombottomnavigationitems.dart';
import 'package:e_commerce/view/widgets/items/customgridviewsubitems.dart';
import 'package:e_commerce/view/widgets/items/customitemsdetailstitle.dart';
import 'package:e_commerce/view/widgets/items/customrowaddanddeleteandprice.dart';
import 'package:e_commerce/view/widgets/items/customstackitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsDetailsScreen extends StatelessWidget {
  const ItemsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: const CustomBottomNavigationItems(text: 'Add To Cart', icon: Icons.shopping_basket_outlined),
        body: ListView(
          children: [
            const CustomStackItem(),
            const SizedBox(height: 125),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomItemDetailsTitle(),
                  const SizedBox(height: 10),
                  const SizedBox(height: 50, child: CustomRowAddAndDeleteAndPrice()),
                  const SizedBox(height: 15),
                  const CustomItemsDetailsDisc(),
                  const SizedBox(height: 10),
                  Text("Colors", style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Appcolors.night2)),
                  const SizedBox(height: 3),
                  const CustomItemsDetailsGridView(),
                ],
              ),
            )
          ],
        ));
  }
}
