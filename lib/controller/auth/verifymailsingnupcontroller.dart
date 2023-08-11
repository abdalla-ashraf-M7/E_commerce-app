import 'package:e_commerce/core/constant/approutes.dart';
import 'package:get/get.dart';

abstract class VerifyEmailSignupController extends GetxController {
  gotosucesssignup();
}

late String VerifyEmailSignup;

class VerifyEmailSignupControllerImp extends VerifyEmailSignupController {
  @override
  gotosucesssignup() {
    Get.toNamed(Approutes.sucesssignup);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
