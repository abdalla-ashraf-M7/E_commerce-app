import 'package:get/get.dart';

ValidInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "52".tr;
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "55".tr;
    }
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "56".tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "57".tr;
    }
  }

  if (val.length < min) {
    return "${"58".tr}$min";
  }
  if (val.length > max) {
    return "${"59".tr}$max";
  }
}
