import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:e_commerce/firebase_options.dart';

class MyServices extends GetxService {
  SharedPreferences? sharedPrefs;

  Future<MyServices> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    sharedPrefs = await SharedPreferences.getInstance();

    return this;
  }
}

initialservices() async {
  await Get.putAsync(() => MyServices().init());
}
