import 'package:e_commerce/core/class/requeststatus.dart';
import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasource/remote/auth/verifysignupdata.dart';
import 'package:get/get.dart';

abstract class VerifyEmailSignupController extends GetxController {
  gotosucesssignup();
}

class VerifyEmailSignupControllerImp extends VerifyEmailSignupController {
  late String verifycode;
  late String email;
  requeststatus requeststate = requeststatus.success;
  @override
  gotosucesssignup() async {
    VerifySignupData verifySignupData = VerifySignupData(Get.find());
    requeststate = requeststatus.loading;
    update();
    var response = await verifySignupData.getData(email, verifycode);
    print("++++++++++++++++++$response+++++++++++++++");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response["status"] == "success") {
        Get.toNamed(Approutes.sucesssignup);
      } else {
        requeststate = requeststatus.failaur;
      }
      {}
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
