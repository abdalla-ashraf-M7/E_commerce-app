import 'dart:io';

import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> exitAlert() {
  Get.defaultDialog(
      barrierDismissible: true,
      radius: 20,
      title: "Warning!!",
      titleStyle: const TextStyle(fontSize: 40, color: Appcolors.primarycolor),
      content: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: const Text(
          "Are You Sure That You WantTo Exit The App?",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Appcolors.grey,
            fontSize: 20,
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "Cancle",
              style: TextStyle(fontSize: 28),
            )),
        const SizedBox(width: 40),
        TextButton(
            style: ButtonStyle(overlayColor: MaterialStateProperty.all(Appcolors.primarycolor)),
            onPressed: () {
              exit(0);
            },
            child: const Text(
              "Confirm",
              style: TextStyle(color: Colors.red, fontSize: 28),
            )),
      ]);
  return Future.value(true);
}
