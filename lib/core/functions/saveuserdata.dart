import 'package:e_commerce/core/services/services.dart';
import 'package:get/get.dart';

MyServices myServices = Get.find();
saveUserData(String id, String username, String email, String password, String phone) {
  myServices.sharedPrefs!.setString("id", id);
  myServices.sharedPrefs!.setString("email", email);
  myServices.sharedPrefs!.setString("phone", phone);
  myServices.sharedPrefs!.setString("username", username);
  myServices.sharedPrefs!.setString("password", password);
  myServices.sharedPrefs!.setString("step", "2");
}
