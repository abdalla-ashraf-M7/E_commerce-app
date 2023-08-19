import 'package:e_commerce/controller/items/itemscontroller.dart';
import 'package:e_commerce/data/model/categoriesmodel.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListViewCatsInItems extends GetView<ItemsControllerImp> {
  const CustomListViewCatsInItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.cats.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 25,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return CategoriesInPage(
            i: index,
            catsModelInPage: CategoriesModel.fromJson(controller.cats[index]),
          );
        },
      ),
    );
  }
}

class CategoriesInPage extends GetView<ItemsControllerImp> {
  const CategoriesInPage({
    super.key,
    required this.catsModelInPage,
    required this.i,
  });
  final CategoriesModel catsModelInPage;
  final int i;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(
        builder: (controller) => InkWell(
              onTap: () {
                controller.changecatnumber(i);
                controller.filterlist("${controller.cats[i]['cats_name']}");
              },
              child: Container(
                decoration: controller.catnumber == i ? const BoxDecoration(border: Border(bottom: BorderSide(width: 4, color: Appcolors.primarycolor))) : null,
                child: Text(
                  "${catsModelInPage.catsName}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: controller.catnumber == i ? Appcolors.primarycolor : Appcolors.night2,
                    fontSize: 25,
                  ),
                ),
              ),
            ));
  }
}
