import 'package:e_commerce/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class RessetPasswordController extends GetxController {
  gotosucessressetpassword();
}

class RessetPasswordControllerImp extends RessetPasswordController {
  GlobalKey<FormState>? ressetPasswordformstate;
  TextEditingController? password1;
  TextEditingController? password2;

  @override
  gotosucessressetpassword() {
    Get.offAllNamed(Approutes.sucessressetpassword);
  }

  @override
  void onInit() {
    ressetPasswordformstate = GlobalKey();
    password1 = TextEditingController();
    password2 = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password1!.dispose();
    password2!.dispose();

    super.dispose();
  }
}
