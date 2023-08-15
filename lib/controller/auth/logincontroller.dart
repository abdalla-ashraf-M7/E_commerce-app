import 'package:e_commerce/core/class/requeststatus.dart';
import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasource/remote/auth/logindata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LogInController extends GetxController {
  login();
  gotosignup();
  gotoforgetpassword();
  hidepassword();
}

class LogInControllerImp extends LogInController {
  GlobalKey<FormState>? loginformstate;
  TextEditingController? email;
  TextEditingController? password;
  bool ispasswordhidden = true;

  @override
  gotosignup() {
    Get.toNamed(Approutes.signup);
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
  gotoforgetpassword() {
    Get.toNamed(Approutes.forgetpassword);
  }

  LoginData loginData = LoginData(Get.find());
  requeststatus reqeuststate = requeststatus.success;
  @override
  login() async {
    if (loginformstate!.currentState!.validate()) {
      reqeuststate = requeststatus.loading;
      update();
      var response = await loginData.getData(email!.text, password!.text);
      print("**********************$response");
      reqeuststate = handlingData(response);
      if (reqeuststate == requeststatus.success) {
        if (response["status"] == "success") {
          Get.toNamed(Approutes.home);
        } else if (response["message"] == "xapprove") {
          reqeuststate = requeststatus.xapprove;
        } else if (response["message"] == "xwrong") {
          reqeuststate = requeststatus.failaur;
        } else {
          reqeuststate == requeststatus.unknown;
        }
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ $reqeuststate");
        update();
      }
    }
  }

  @override
  void onInit() {
    loginformstate = GlobalKey();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email!.dispose();
    password!.dispose();
    super.dispose();
  }
}
