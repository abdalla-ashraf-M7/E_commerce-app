import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustomRowSignAuth extends StatelessWidget {
  const CustomRowSignAuth({super.key, required this.text1, required this.text2, required this.tap});
  final String text1;
  final String text2;
  final void Function() tap;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          InkWell(
            onTap: tap,
            child: Text(
              text2,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Appcolors.primarycolor, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
