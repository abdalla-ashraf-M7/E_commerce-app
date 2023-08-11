import 'package:flutter/material.dart';

class CustomForgetAuth extends StatelessWidget {
  const CustomForgetAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      width: double.infinity,
      child: InkWell(
        child: Text(
          "Forget Password?",
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
