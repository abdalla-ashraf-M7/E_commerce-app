import 'package:e_commerce/core/class/requeststatus.dart';
import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/core/functions/saveuserdata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/remote/auth/logindata.dart';
import 'package:e_commerce/view/widgets/defaultdialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/fcmconfig.dart';

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
  MyServices myServices = Get.find();
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
          try {
            saveUserData(
              response['data']['users_id'],
              response['data']['users_name'],
              response['data']['users_email'],
              response['data']['users_password'],
              response['data']['users_phone'],
            );
            String id = "${myServices.sharedPrefs!.getString("id")}";
            await permissionNotification();
            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users$id");

            Get.offAllNamed(Approutes.homescreen);
          } catch (e) {
            print("(???????????????????????????????$e)");
            defultDialog("Warning!!", "save user data error sorry try later", "Cancle", "try again", 60, 10, () {
              Get.offAllNamed(Approutes.login);
            }, () {
              Get.back();
            });
            update();
          }
        } else if (response["message"] == "xapprove") {
          reqeuststate = requeststatus.xapprove;
          defultDialog("Warning!!", "You need to verify your email first press verify and check your email we have sent you verification code", "Cancle", "Verify", 60, 10, () {
            Get.offAllNamed(Approutes.login);
          }, () {
            Get.toNamed(Approutes.verifyemailsignup, arguments: {"email": email!.text});
          });
          update();
        } else if (response["message"] == "xwrong") {
          reqeuststate = requeststatus.failaur;
          defultDialog("Warning!!", "Email or passowrd is not correct", "Cancle", "Try Again", 60, 10, () {
            Get.offAllNamed(Approutes.login);
          }, () {
            Get.back();
          });
          update();
        } else {
          reqeuststate == requeststatus.unknown2;
          update();
        }
      } else if (reqeuststate == requeststatus.unknown) {
        defultDialog("Warning!!", "Sorry it is unkown error try later", "Cancle", "Try Again", 60, 10, () {
          Get.offAllNamed(Approutes.login);
          update();
        }, () {
          Get.back();
        });
      }
      print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ $reqeuststate");
      //update();
    }
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print("********$value");
    });
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
