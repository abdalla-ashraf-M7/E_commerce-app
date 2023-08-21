import 'package:e_commerce/controller/fav/addanddeletefavcontroller.dart';
import 'package:e_commerce/controller/home/homecontroller.dart';
import 'package:e_commerce/core/class/handlingdatview.dart';
import 'package:e_commerce/view/widgets/homewidgets/cusomlistviewitems.dart';
import 'package:e_commerce/view/widgets/homewidgets/customiconhome.dart';
import 'package:e_commerce/view/widgets/homewidgets/customlistviewcats.dart';
import 'package:e_commerce/view/widgets/homewidgets/customofferboard.dart';
import 'package:e_commerce/view/widgets/homewidgets/customsearch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    FavControllerImp controllerfav = Get.put(FavControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => HandlinDataView(
              requeststat: controller.requeststate,
              widget: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: ListView(
                  children: [
                    Row(children: [
                      const CustomSearchWidget(hint: "Find a Product"),
                      const SizedBox(width: 10),
                      CustomIconHome(
                          icon: Icons.favorite_border_outlined,
                          onpressicon: () {
                            controller.gotofavorite();
                            controllerfav.getfav();
                          }),
                      const SizedBox(width: 10),
                      CustomIconHome(
                        icon: Icons.notifications_active_outlined,
                        onpressicon: () {},
                      ),
                    ]),
                    const SizedBox(height: 30),
                    const CustomOfferBoard(text1: "Winter Offer", text2: "Cashback 20%"),
                    const SizedBox(height: 15),
                    Text("Categories", style: Theme.of(context).textTheme.displayLarge),
                    const SizedBox(height: 10),
                    const CustomListViewCats(),
                    const SizedBox(height: 15),
                    Text("Discount For You ", style: Theme.of(context).textTheme.displayLarge),
                    const SizedBox(height: 5),
                    const CustomListViewItems(),
                  ],
                ),
              ),
            ));
  }
}
