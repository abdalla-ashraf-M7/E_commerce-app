import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/colors.dart';

defultDialog(String title, String content, String buttontext1, String buttontext2, double contentpadding, double sizebetwwenbuttons, void Function()? onpressed1, void Function()? onpressed2) {
  Get.defaultDialog(
      radius: 20,
      title: title,
      titleStyle: const TextStyle(fontSize: 40, color: Appcolors.primarycolor),
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: contentpadding),
        child: Text(
          content,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Appcolors.grey4,
            fontSize: 20,
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: onpressed1,
            child: Text(
              buttontext1,
              style: TextStyle(color: Colors.red, fontSize: 28),
            )),
        SizedBox(width: sizebetwwenbuttons),
        TextButton(style: ButtonStyle(overlayColor: MaterialStateProperty.all(Appcolors.primarycolor)), onPressed: onpressed2, child: Text(buttontext2, style: TextStyle(fontSize: 28))),
      ]);
}
