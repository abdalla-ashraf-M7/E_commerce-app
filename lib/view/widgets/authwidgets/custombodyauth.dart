import 'package:flutter/material.dart';

class CustomBodyAuth extends StatelessWidget {
  const CustomBodyAuth({super.key, required this.body});
  final String body;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 35),
      child: Text(
        body,
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}
