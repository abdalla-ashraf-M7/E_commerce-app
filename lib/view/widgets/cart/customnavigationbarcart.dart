import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationCart extends StatelessWidget {
  const CustomBottomNavigationCart({super.key, required this.text, required this.icon, this.ontap, required this.databasetotalprice, required this.shipping});
  final String text;
  final IconData icon;
  final double databasetotalprice;
  final double shipping;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Products Price",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text("$databasetotalprice \$", style: const TextStyle(fontSize: 20))
                  ],
                ),
              ),
              SizedBox(
                height: 30,
                //color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Shipping",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text("$shipping %", style: const TextStyle(fontSize: 20))
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: const Divider(thickness: 2),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total Price", style: TextStyle(fontSize: 25)),
              Text(
                "${databasetotalprice + (databasetotalprice * shipping / 100)} \$",
                style: TextStyle(fontSize: 25, color: Appcolors.primarycolor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: ontap,
          child: Container(
            decoration: BoxDecoration(color: Appcolors.secondarycolor, borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
            height: 50,
            width: Get.width - 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(icon, color: Appcolors.white, size: 25), const SizedBox(width: 10), Text(text, style: const TextStyle(fontSize: 25, color: Appcolors.white))],
            ),
          ),
        ),
      ],
    );
  }
}
