import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationItems extends StatelessWidget {
  const CustomBottomNavigationItems({super.key, required this.text, required this.icon, this.ontap});
  final String text;
  final IconData icon;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(color: Appcolors.red2, borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
        height: 50,
        width: Get.width - 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Appcolors.white,
              size: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 25, color: Appcolors.white),
            )
          ],
        ),
      ),
    );
  }
}
