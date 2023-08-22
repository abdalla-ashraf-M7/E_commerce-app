import 'package:flutter/material.dart';

class CustomAppBarCart extends StatelessWidget {
  const CustomAppBarCart({super.key, this.onTabBackIcon});
  final void Function()? onTabBackIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Container(alignment: AlignmentDirectional.centerStart, child: IconButton(onPressed: onTabBackIcon, icon: const Icon(Icons.arrow_back)))),
        Expanded(
          flex: 1,
          child: Text(
            "My Cart",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 38),
          ),
        ),
        Expanded(flex: 1, child: Container())
      ],
    );
  }
}
