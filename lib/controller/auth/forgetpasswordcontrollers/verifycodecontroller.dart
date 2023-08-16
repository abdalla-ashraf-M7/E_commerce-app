import 'package:e_commerce/core/class/requeststatus.dart';
import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasource/remote/forgetpassword/verifycodeforgetpass.dart';
import 'package:e_commerce/view/widgets/defaultdialog.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  gotoressetpassword(String verifycode);
}

String? email;

class VerifyCodeControllerImp extends VerifyCodeController {
  VerifyCodeForgetPassData verifyCodeForgetPassData = VerifyCodeForgetPassData(Get.find());
  requeststatus requeststate = requeststatus.success;

  @override
  gotoressetpassword(String verifycode) async {
    requeststate = requeststatus.loading;
    update();
    var response = await verifyCodeForgetPassData.getData(email!, verifycode);
    print("################################$response");

    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response["status"] == "success") {
        Get.offNamed(Approutes.ressetpassword, arguments: {"email": email});
      } else {
        defultDialog("Warning!!", "Verification Code is not correct", "Cancle", "Try Again", 60, 10, () {
          Get.offAllNamed(Approutes.login);
        }, () {
          Get.back();
        });
        requeststate = requeststatus.failaur;
      }
      update();
    }
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
