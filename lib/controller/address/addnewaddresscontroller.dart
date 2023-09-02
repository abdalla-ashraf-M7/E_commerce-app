import 'dart:async';

import 'package:e_commerce/core/class/requeststatus.dart';
import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/core/functions/checkperlocation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AddNewAddressController extends GetxController {
  getCurrentPosition();
  initialData();
  addmarker(LatLng latLng);
  gotoAddressDetails();
  //requestPerLofcation();
}

class AddNewAddressControllerImp extends AddNewAddressController {
  Completer<GoogleMapController>? completercontroller;
  Position? position;
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];
  requeststatus requeststate = requeststatus.success;
  /*  bool? serviceEnabled;*/
  String? rLocationStatus;
  @override
  void onInit() async {
    rLocationStatus = await requestPerLofcation();
    //await requestPerLofcation();
    initialData();
    super.onInit();
  }

  @override
  initialData() async {
    if (rLocationStatus != "0" && rLocationStatus != "1" && rLocationStatus != "2") {
      await getCurrentPosition();
      addmarker(LatLng(position!.latitude, position!.longitude));
      completercontroller = Completer<GoogleMapController>();
    }
  }

  /*  @override
  requestPerLofcation() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled!) {
      return Get.defaultDialog(title: "Warning", middleText: "Please enable the location serivice in your phone");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.defaultDialog(title: "Warning", middleText: "You can't use this service without giving us the location permission");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      return Get.defaultDialog(title: "Warning", middleText: "You denied the location permission for ever Please go to settings and give us location permission");
    }
  } */

  @override
  getCurrentPosition() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14,
    );
    requeststate = requeststatus.success;
    print("**********************************8");
    print(position!.longitude);
    print(position!.latitude);
    update();
  }

  @override
  addmarker(latLng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId('1'), position: latLng));
    update();
  }

  @override
  gotoAddressDetails() {
    Get.toNamed(Approutes.addressDetails, arguments: {
      "lat": position!.latitude,
      "long": position!.longitude,
    });
  }
}
