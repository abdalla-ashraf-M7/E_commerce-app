import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  const CustomTextFormAuth(
      {super.key, required this.hint, required this.label, required this.icon, required this.textformcontroller, required this.valid, this.isnumber, this.isobscure, this.ontapicon});
  final String hint;
  final String label;
  final IconData icon;
  final bool? isnumber;
  final bool? isobscure;
  final void Function()? ontapicon;

  final String? Function(String?) valid;
  final TextEditingController? textformcontroller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isobscure == null || isobscure == false ? false : true,
      validator: valid,
      keyboardType: isnumber == true ? TextInputType.phone : TextInputType.text,
      controller: textformcontroller,
      decoration: InputDecoration(
          suffixIcon: InkWell(
            child: Icon(icon),
            onTap: ontapicon,
          ),
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
