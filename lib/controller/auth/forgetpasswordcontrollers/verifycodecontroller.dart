import 'package:e_commerce/core/constant/approutes.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  gotoressetpassword();
}

late String verifycode;

class VerifyCodeControllerImp extends VerifyCodeController {
  @override
  gotoressetpassword() {
    Get.toNamed(Approutes.ressetpassword);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
