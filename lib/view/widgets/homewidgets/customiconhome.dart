import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomIconHome extends StatelessWidget {
  const CustomIconHome({super.key, required this.icon, this.onpressicon});
  final IconData icon;
  final void Function()? onpressicon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: const BoxDecoration(color: Appcolors.grey1, shape: BoxShape.circle),
      child: IconButton(
          onPressed: onpressicon,
          icon: Icon(
            icon,
            size: 35,
            color: Colors.grey.shade600,
          )),
    );
  }
}
