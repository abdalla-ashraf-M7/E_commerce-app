import 'package:e_commerce/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class RessetPasswordController extends GetxController {
  gotosucessressetpassword();
  hidepassword();
  hidepassword2();
}

class RessetPasswordControllerImp extends RessetPasswordController {
  GlobalKey<FormState>? ressetPasswordformstate;
  TextEditingController? password1;
  TextEditingController? password2;
  bool ispasswordhidden = true;
  bool ispasswordhidden2 = true;

  @override
  gotosucessressetpassword() {
    FormState? formdata = ressetPasswordformstate!.currentState;
    if (formdata!.validate()) {
      /* if (password1 == password2) {
        Get.offAllNamed(Approutes.sucessressetpassword);
      }  */
      Get.offAllNamed(Approutes.sucessressetpassword);
    }
  }

  @override
  hidepassword() {
    if (ispasswordhidden == false) {
      ispasswordhidden = true;
    } else {
      ispasswordhidden = false;
    }
    update();
  }

  @override
  hidepassword2() {
    if (ispasswordhidden2 == false) {
      ispasswordhidden2 = true;
    } else {
      ispasswordhidden2 = false;
    }
    update();
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
