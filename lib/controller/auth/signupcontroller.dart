import 'package:e_commerce/core/class/requeststatus.dart';
import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasource/remote/auth/signupdata.dart';
import 'package:e_commerce/view/widgets/defaultdialog.dart';
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

  SignUpData signUpData = SignUpData(Get.find());
  List data = [];
  requeststatus requeststate = requeststatus.success;
  @override
  gotoverifyemailsignup() async {
    if (signupformstate!.currentState!.validate()) {
      requeststate = requeststatus.loading;
      update();
      var response = await signUpData.getData(username!.text, email!.text, password!.text, phone!.text);
      print("333333333333333333333333$response");
      requeststate = handlingData(response);
      if (requeststate == requeststatus.success) {
        if (response["status"] == "success") {
          //data.addAll(response['data']);
          Get.offNamed(Approutes.verifyemailsignup, arguments: {"email": email!.text});
        } else {
          requeststate = requeststatus.failaur;
          defultDialog("Warning!!", "Email or Phone is already used", "Cancle", "Try Again", 60, 10, () {
            Get.offAllNamed(Approutes.login);
          }, () {
            Get.back();
          });
        }
      } else {}
    }
    update();
  }

  @override
  signup() {}

  @override
  void onInit() {
    signupformstate = GlobalKey();
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
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
