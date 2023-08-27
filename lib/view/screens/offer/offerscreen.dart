import 'package:e_commerce/controller/fav/addanddeletefavcontroller.dart';
import 'package:e_commerce/controller/offer/offercontroller.dart';
import 'package:e_commerce/core/class/handlingdatview.dart';
import 'package:e_commerce/view/widgets/offer/customcardoffer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/homewidgets/customiconhome.dart';
import '../../widgets/homewidgets/customsearch.dart';
import '../../widgets/items/search/customcardsearch.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OfferControllerImp());
    FavControllerImp controllerfav = Get.put(FavControllerImp());

    return GetBuilder<OfferControllerImp>(
        builder: (controller) => ListView(
              children: [
                SizedBox(height: 5),
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
                  const CustomIconHome(icon: Icons.notifications_active_outlined),
                ]),
                SizedBox(height: 15),
                controller.isSearch
                    ? ListView.builder(
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
                      )
                    : HandlinDataView(
                        requeststat: controller.requeststate,
                        widget: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            controllerfav.isfav[controller.data[index].itemsId] = controller.data[index].favs;
                            return CustomCardOffer(itemsModel: controller.data[index], i: index);
                          },
                        ),
                      )
              ],
            ));
  }
}
