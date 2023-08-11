import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
              backgroundColor: const MaterialStatePropertyAll(Appcolors.primarycolor)),
          onPressed: () {},
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelLarge,
          )),
    );
  }
}