import 'package:e_commerce/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  gotoverifycode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState>? forgetpasswordformstate;
  TextEditingController? email;

  @override
  gotoverifycode() {
    Get.toNamed(Approutes.verifycode);
  }

  @override
  void onInit() {
    forgetpasswordformstate = GlobalKey();
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email!.dispose();

    super.dispose();
  }
}
