import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({super.key, required this.hint, this.tappreffixicon});
  final String hint;
  final void Function()? tappreffixicon;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextFormField(
      style: TextStyle(fontSize: 25, color: Colors.grey.shade600),
      cursorColor: Appcolors.primarycolor,
      decoration: InputDecoration(
          iconColor: Colors.black,
          focusColor: Appcolors.primarycolor,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          prefixIcon: InkWell(
            onTap: tappreffixicon,
            child: const Icon(Icons.search_outlined),
          ),
          prefixIconColor: MaterialStateColor.resolveWith(
            (states) => states.contains(MaterialState.focused) ? Appcolors.primarycolor : Colors.grey.shade600,
          ),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 25),
          border: const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(30))),
          filled: true,
          fillColor: Appcolors.grey1),
    ));
  }
}
