import 'package:e_commerce/core/constant/approutes.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  gotologin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  gotologin() {
    Get.offAllNamed(Approutes.login);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
