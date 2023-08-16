import 'package:e_commerce/core/class/requeststatus.dart';
import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasource/remote/forgetpassword/ressetpassworddata.dart';
import 'package:e_commerce/view/widgets/defaultdialog.dart';
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
  String? email;
  RessetPasswordData ressetPasswordData = RessetPasswordData(Get.find());
  requeststatus requeststate = requeststatus.success;
  @override
  gotosucessressetpassword() async {
    if (ressetPasswordformstate!.currentState!.validate()) {
      if (password1!.text == password2!.text) {
        requeststate = requeststatus.loading;
        update();
        var response = await ressetPasswordData.getData(email!, password1!.text);
        print("################################$response");
        requeststate = handlingData(response);
        if (requeststate == requeststatus.success) {
          if (response["status"] == "success") {
            Get.offNamed(Approutes.sucessressetpassword);
          } else {
            defultDialog("Warning!!", "${response['message']}", "Cancle", "Try Again", 60, 10, () {
              Get.offAllNamed(Approutes.login);
            }, () {
              Get.back();
            });
            requeststate = requeststatus.failaur;
          }
        }
      } else {
        defultDialog("Warning!!", "Passwords are not equal", "Cancle", "Try Again", 60, 10, () {
          Get.offAllNamed(Approutes.login);
        }, () {
          Get.back();
        });
      }
      update();
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
    email = Get.arguments["email"];

    super.onInit();
  }

  @override
  void dispose() {
    password1!.dispose();
    password2!.dispose();

    super.dispose();
  }
}
