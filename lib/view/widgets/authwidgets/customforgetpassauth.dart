import 'package:flutter/material.dart';

class CustomForgetAuth extends StatelessWidget {
  const CustomForgetAuth({super.key, this.tap});
  final void Function()? tap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      width: double.infinity,
      child: InkWell(
        onTap: tap,
        child: Text(
          "Forget Password?",
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
