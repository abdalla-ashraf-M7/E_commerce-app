import 'dart:async';

import 'package:e_commerce/core/class/requeststatus.dart';
import 'package:e_commerce/core/constant/approutes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AddNewAddressController extends GetxController {
  getCurrentPosition();
  initialData();
  addmarker(LatLng latLng);
  gotoAddressDetails();
}

class AddNewAddressControllerImp extends AddNewAddressController {
  Completer<GoogleMapController>? completercontroller;
  Position? position;
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];
  requeststatus requeststate = requeststatus.loading;

  @override
  initialData() async {
    await getCurrentPosition();
    addmarker(LatLng(position!.latitude, position!.longitude));
    completercontroller = Completer<GoogleMapController>();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  getCurrentPosition() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 10,
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
