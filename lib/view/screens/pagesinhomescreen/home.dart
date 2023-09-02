import 'package:e_commerce/controller/fav/addanddeletefavcontroller.dart';
import 'package:e_commerce/controller/home/homecontroller.dart';
import 'package:e_commerce/core/class/handlingdatview.dart';
import 'package:e_commerce/view/widgets/homewidgets/cusomlistviewitems.dart';
import 'package:e_commerce/view/widgets/homewidgets/customiconhome.dart';
import 'package:e_commerce/view/widgets/homewidgets/customlistviewcats.dart';
import 'package:e_commerce/view/widgets/homewidgets/customofferboard.dart';
import 'package:e_commerce/view/widgets/homewidgets/customsearch.dart';
import 'package:e_commerce/view/widgets/items/search/customcardsearch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    FavControllerImp controllerfav = Get.put(FavControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        padding: controller.isSearch ? const EdgeInsets.symmetric(horizontal: 10, vertical: 10) : const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            Row(children: [
              CustomSearchWidget(
                  onTapSuffixIcon: () {
                    controller.onXpress();
                  },
                  tapOnPreffixIcon: () {
                    controller.onSearch();
                  },
                  onchangesearch: (value) {
                    controller.onWrite();
                  },
                  mycontroller: controller.controllerhome,
                  hint: "Find a Product"),
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
                onpressicon: () {
                  controller.gotonotifications();
                },
              ),
            ]),
            const SizedBox(height: 20),
            controller.isSearch
                ? RefreshIndicator(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.searchlist.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CustomCardSearch(
                                onCardTap: () {
                                  controller.gotoitemsdetails(controller.searchlist[index]);
                                },
                                imagename: "${controller.searchlist[index].itemsImage}",
                                itemname: "${controller.searchlist[index].itemsName}",
                                itemprice: "${controller.searchlist[index].itemsPrice} \$");
                          },
                        ),
                      ],
                    ),
                    onRefresh: () async {
                      controller.viewSearch();
                    })
                : RefreshIndicator(
                    child: HandlinDataView(
                      requeststat: controller.requeststate,
                      widget: ListView(
                        shrinkWrap: true,
                        children: [
                          CustomOfferBoard(text1: controller.titlehome, text2: controller.bodyhome),
                          const SizedBox(height: 15),
                          Text("Categories", style: Theme.of(context).textTheme.displayLarge),
                          const SizedBox(height: 10),
                          const CustomListViewCats(),
                          const SizedBox(height: 15),
                          Text("Top Sales", style: Theme.of(context).textTheme.displayLarge),
                          const SizedBox(height: 5),
                          const CustomListViewItems(),
                        ],
                      ),
                    ),
                    onRefresh: () async {
                      controller.refreshData();
                    })
          ],
        ),
      ),
    );
  }
}
