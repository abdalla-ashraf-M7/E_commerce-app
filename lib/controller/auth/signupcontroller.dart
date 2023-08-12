import 'package:e_commerce/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signup();
  hidepassword();
  gotologin();
  gotoverifyemailsignup();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState>? signupformstate;
  TextEditingController? email;
  TextEditingController? password;
  TextEditingController? username;
  TextEditingController? phone;
  bool ispasswordhidden = true;

  @override
  gotologin() {
    Get.offAllNamed(Approutes.login);
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
  gotoverifyemailsignup() {
    FormState? formdata = signupformstate!.currentState;
    if (formdata!.validate()) {
      Get.toNamed(Approutes.verifyemailsignup);
    }
  }

  @override
  signup() {}

  @override
  void onInit() {
    signupformstate = GlobalKey();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email!.dispose();
    password!.dispose();
    username!.dispose();
    phone!.dispose();
    super.dispose();
  }
}
