import 'package:e_commerce/core/class/requeststatus.dart';
import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/remote/address/addressdata.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdata.dart';

abstract class AddressDetailsController extends GetxController {
  intitialData();
  AddNewAddress();
}

class AddressDetailsControllerImp extends AddressDetailsController {
  double? lat;
  double? long;
  requeststatus requeststate = requeststatus.success;
  late TextEditingController name;
  late TextEditingController city;
  late TextEditingController street;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  @override
  intitialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    print(lat);
    print(long);
  }

  @override
  void onInit() {
    intitialData();
    super.onInit();
  }

  @override
  AddNewAddress() async {
    requeststate = requeststatus.loading;
    update();
    var response = await addressData.addAdress(
      "${myServices.sharedPrefs!.getString('id')}",
      name.text,
      city.text,
      street.text,
      lat.toString(),
      long.toString(),
    );
    print("8888888888888addAdress888888888$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(title: "Good", message: "new address added");
        Get.offAllNamed(Approutes.homescreen);
      } else {
        requeststate = requeststatus.failaur;
      }
    } else {
      requeststate = requeststatus.serverFailaur;
    }
    update();
  }
}
