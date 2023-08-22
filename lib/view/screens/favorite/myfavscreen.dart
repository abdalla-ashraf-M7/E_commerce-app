import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/fav/addanddeletefavcontroller.dart';
import 'package:e_commerce/core/class/handlingdatview.dart';
import 'package:e_commerce/core/constant/applinks.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/view/widgets/homewidgets/customiconhome.dart';
import 'package:e_commerce/view/widgets/homewidgets/customsearch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/items/search/customcardsearch.dart';

class MyfavScreen extends StatelessWidget {
  const MyfavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FavControllerImp controller = Get.put(FavControllerImp());
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: [
          Row(
            children: [
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
              const SizedBox(
                width: 15,
              ),
              const CustomIconHome(
                icon: Icons.notifications_active_outlined,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          GetBuilder<FavControllerImp>(
              builder: (controller) => controller.isSearch
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
                      widget: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: .7),
                        itemCount: controller.myfavs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return HandlinDataView(
                              requeststat: controller.requeststate,
                              widget: InkWell(
                                onTap: () {
                                  //controller.gotoitemsdetails(itemsModel);
                                  print(controller.myfavs.length);
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
                                              child: CachedNetworkImage(
                                                imageUrl: "${AppLinks.itmesimages}/${controller.myfavs[index].itemsImage}",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "${controller.myfavs[index].itemsName}",
                                              style: const TextStyle(fontSize: 23, color: Appcolors.primarycolor, fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "${controller.myfavs[index].itemsDesc}",
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(color: Appcolors.night2, fontSize: 16),
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
                                                      "${controller.myfavs[index].itemsPrice} \$",
                                                      style: const TextStyle(fontSize: 23, color: Appcolors.primarycolor, fontWeight: FontWeight.bold),
                                                    ),
                                                    //
                                                    InkWell(
                                                        onTap: () {
                                                          controller.deletefavfromfavscreen("${controller.myfavs[index].favId}");
                                                        },
                                                        child: const Icon(
                                                          Icons.delete_outline,
                                                          size: 27,
                                                          color: Appcolors.orange1,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    controller.myfavs[index].itemsDiscount != "0"
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
                                                  "${controller.myfavs[index].itemsDiscount}%",
                                                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Appcolors.white),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container()
                                  ],
                                ),
                              ));
                        },
                      )))
        ],
      ),
    ));
  }
}
