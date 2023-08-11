import 'package:e_commerce/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signup();
  gotologin();
  gotoverifyemailsignup();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState>? signupformstate;
  TextEditingController? email;
  TextEditingController? password;
  TextEditingController? username;
  TextEditingController? phone;

  @override
  gotologin() {
    Get.offAllNamed(Approutes.login);
  }

  @override
  gotoverifyemailsignup() {
    Get.toNamed(Approutes.verifyemailsignup);
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
