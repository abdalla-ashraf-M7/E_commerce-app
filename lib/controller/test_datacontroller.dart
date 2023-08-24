import 'dart:async';

import 'package:e_commerce/core/class/requeststatus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TestController extends GetxController {
  Completer<GoogleMapController>? completercontroller;
  Position? position;
  CameraPosition? kGooglePlex;
  requeststatus requeststate = requeststatus.loading;

  getCurrentPosition() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.longitude, position!.latitude),
      zoom: 14.4746,
    );
    requeststate = requeststatus.success;
    print("**********************************8");
    print(position!.longitude);
    print(position!.latitude);
    update();
  }

  @override
  void onInit() {
    getCurrentPosition();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}
