import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/constant/applinks.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomCardSearch extends StatelessWidget {
  const CustomCardSearch({super.key, required this.imagename, required this.itemname, required this.itemprice, this.onCardTap});
  final String imagename;
  final String itemname;
  final String itemprice;
  final void Function()? onCardTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCardTap,
      child: SizedBox(
        height: 110,
        width: double.infinity,
        child: Card(
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Appcolors.primarycolor,
                      ),
                      height: double.infinity,
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: "${AppLinks.itmesimages}/$imagename",
                      ))),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: double.infinity,
                  child: ListTile(
                    title: Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Text(
                        itemname,
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    subtitle: Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Text(
                        itemprice,
                        style: const TextStyle(fontSize: 20, color: Appcolors.primarycolor),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 20,
                  top: 5,
                  bottom: 2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
