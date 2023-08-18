import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomOfferBoard extends StatelessWidget {
  const CustomOfferBoard({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          height: 180,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Appcolors.primarycolor),
          child: ListTile(
            title: Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text(
                text1,
                style: const TextStyle(color: Appcolors.night1, fontSize: 25),
              ),
            ),
            subtitle: Text(
              text2,
              style: const TextStyle(color: Appcolors.night2, fontSize: 33, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Positioned(
          right: -25,
          top: -25,
          child: Container(
            height: 190,
            width: 190,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Appcolors.red2,
            ),
          ),
        )
      ],
    );
  }
}
