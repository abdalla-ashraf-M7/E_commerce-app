import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  SharedPreferences? sharedPrefs;

  Future<MyServices> init() async {
    sharedPrefs = await SharedPreferences.getInstance();
    return this;
  }
}

initialservices() async {
  await Get.putAsync(() => MyServices().init());
}
