import 'package:e_commerce/controller/home/homecontroller.dart';
import 'package:e_commerce/data/model/categoriesmodel.dart';
import 'package:e_commerce/core/constant/applinks.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomListViewCats extends GetView<HomeControllerImp> {
  const CustomListViewCats({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.cats.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return CategoriesInPage(
            catsModelInPage: CategoriesModel.fromJson(controller.cats[index]),
          );
        },
      ),
    );
  }
}

class CategoriesInPage extends StatelessWidget {
  const CategoriesInPage({
    super.key,
    required this.catsModelInPage,
  });
  final CategoriesModel catsModelInPage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)), color: Appcolors.pink1),
          width: 70,
          height: 90,
          child: SvgPicture.network(
            "${AppLinks.catsimages}/${catsModelInPage.catsImage}",
            colorFilter: const ColorFilter.mode(Appcolors.red3, BlendMode.srcIn),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "${catsModelInPage.catsName}",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Appcolors.night2, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
