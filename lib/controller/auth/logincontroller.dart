import 'package:e_commerce/core/class/requeststatus.dart';
import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasource/remote/auth/logindata.dart';
import 'package:e_commerce/view/widgets/defaultdialog.dart';
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
      print("22222222222222222222222222$response");
      reqeuststate = handlingData(response);
      if (reqeuststate == requeststatus.success) {
        if (response["status"] == "success") {
          Get.offAllNamed(Approutes.home);
        } else if (response["message"] == "xapprove") {
          reqeuststate = requeststatus.xapprove;
          defultDialog("Warning!!", "You need to verify your email first press verify and check your email we have sent you verification code", "Cancle", "Verify", 60, 10, () {
            Get.offAllNamed(Approutes.login);
          }, () {
            Get.toNamed(Approutes.verifyemailsignup, arguments: {"email": email!.text});
          });
        } else if (response["message"] == "xwrong") {
          reqeuststate = requeststatus.failaur;
          defultDialog("Warning!!", "Email or passowrd is not correct", "Cancle", "Try Again", 60, 10, () {
            Get.offAllNamed(Approutes.login);
          }, () {
            Get.back();
          });
        } else {
          reqeuststate == requeststatus.unknown2;
        }
      } else if (reqeuststate == requeststatus.unknown) {
        defultDialog("Warning!!", "Sorry it is unkown error try later", "Cancle", "Try Again", 60, 10, () {
          Get.offAllNamed(Approutes.login);
        }, () {
          Get.back();
        });
      }
      print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ $reqeuststate");
      update();
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
