import 'package:e_commerce/core/class/requeststatus.dart';
import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasource/remote/forgetpassword/forgetpassworddata.dart';
import 'package:e_commerce/view/widgets/defaultdialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  gotoverifycode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState>? forgetpasswordformstate;
  TextEditingController? email;

  ForgetPasswordData forgetPasswordData = ForgetPasswordData(Get.find());
  requeststatus requeststate = requeststatus.success;
  @override
  gotoverifycode() async {
    if (forgetpasswordformstate!.currentState!.validate()) {
      requeststate = requeststatus.loading;
      update();
      var response = await forgetPasswordData.getData(email!.text);
      print("555555555555555555555555555555$response");

      requeststate = handlingData(response);
      if (requeststate == requeststatus.success) {
        if (response["status"] == "success") {
          Get.offNamed(Approutes.verifycode, arguments: {"email": email!.text});
        } else {
          defultDialog("Warning!!", "Email Not Found", "Cancle", "Try Again", 60, 10, () {
            Get.offAllNamed(Approutes.login);
          }, () {
            Get.back();
          });

          requeststate = requeststatus.failaur;
        }
      }
    }
    update();
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
