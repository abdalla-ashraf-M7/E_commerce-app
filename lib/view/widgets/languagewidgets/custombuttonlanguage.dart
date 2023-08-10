import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonLanguage extends StatelessWidget {
  const CustomButtonLanguage({super.key, required this.text, required this.press});
  final String text;
  final void Function() press;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 250,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              backgroundColor: const MaterialStatePropertyAll(Appcolors.primarycolor)),
          onPressed: press,
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelLarge,
          )),
    );
  }
}
