import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomNumberOfCart extends StatelessWidget {
  const CustomNumberOfCart({super.key, required this.numberofcart});
  final String numberofcart;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Appcolors.secondarycolor),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      height: 40,
      child: Text(
        numberofcart,
        style: TextStyle(fontSize: 20, color: Appcolors.white),
      ),
    );
  }
}
