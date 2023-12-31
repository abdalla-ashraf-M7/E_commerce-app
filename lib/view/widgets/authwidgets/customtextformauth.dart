import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  const CustomTextFormAuth({super.key, required this.hint, required this.label, required this.icon, required this.textformcontroller});
  final String hint;
  final String label;
  final IconData icon;
  final TextEditingController? textformcontroller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textformcontroller,
      decoration: InputDecoration(
          suffixIcon: Icon(icon),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 15),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 22),
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          border: OutlineInputBorder(borderSide: const BorderSide(), borderRadius: BorderRadius.circular(30))),
    );
  }
}
