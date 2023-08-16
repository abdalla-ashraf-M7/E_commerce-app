import 'package:e_commerce/core/services/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {}

MyServices myServices = Get.find();

class HomeControllerImp extends HomeController {
  String? id;
  String? username;
  initialdata() {
    id = myServices.sharedPrefs!.getString("id");
    username = myServices.sharedPrefs!.getString("username");
  }

  @override
  void onInit() {
    initialdata();
    super.onInit();
  }
}
