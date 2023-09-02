import 'package:e_commerce/core/constant/approutes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

bool? serviceEnabled;
LocationPermission? permission;
String? locationStatus;
requestPerLofcation() async {
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled!) {
    Get.offAllNamed(Approutes.homescreen);

    Get.defaultDialog(title: "Warning", middleText: "Please enable the location serivice in your phone");
    return locationStatus = "0";
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      Get.offAllNamed(Approutes.homescreen);

      Get.defaultDialog(title: "Warning", middleText: "You can't use this service without giving us the location permission");
      return locationStatus = "1";
    }
  }
  if (permission == LocationPermission.deniedForever) {
    permission = await Geolocator.requestPermission();
    Get.offAllNamed(Approutes.homescreen);

    Get.offAllNamed(Approutes.homescreen);
    Get.defaultDialog(title: "Warning", middleText: "You denied the location permission for ever Please go to settings and give us location permission");
    return locationStatus = "2";
  }
}
