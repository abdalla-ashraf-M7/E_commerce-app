import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({
    super.key,
    required this.hint,
    this.tapOnPreffixIcon,
    required this.mycontroller,
    this.onchangesearch,
    this.onTapSuffixIcon,
  });
  final String hint;
  final void Function()? tapOnPreffixIcon;
  final void Function(String value)? onchangesearch;
  final void Function()? onTapSuffixIcon;
  final TextEditingController mycontroller;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextFormField(
      controller: mycontroller,
      onChanged: onchangesearch,
      style: TextStyle(fontSize: 25, color: Colors.grey.shade600),
      cursorColor: Appcolors.primarycolor,
      decoration: InputDecoration(
          iconColor: Colors.black,
          focusColor: Appcolors.primarycolor,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          prefixIcon: InkWell(
            onTap: tapOnPreffixIcon,
            child: const Icon(Icons.search_outlined),
          ),
          suffixIconColor: MaterialStateColor.resolveWith(
            (states) => states.contains(MaterialState.focused) ? Appcolors.primarycolor : Colors.grey.shade600,
          ),
          suffixIcon: InkWell(onTap: onTapSuffixIcon, child: Icon(Icons.highlight_remove_rounded)),
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
