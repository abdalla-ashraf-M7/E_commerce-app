import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustomYouDeleteThisAddress extends StatelessWidget {
  const CustomYouDeleteThisAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 150,
        ),
        const Icon(
          Icons.error_outline,
          size: 80,
          color: Appcolors.primarycolor,
        ),
        Container(
          // color: Colors.red,
          child: const Text(
            "Sorry, You have deleted this address,It is no longer avilable",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
        ),
      ],
    );
  }
}
