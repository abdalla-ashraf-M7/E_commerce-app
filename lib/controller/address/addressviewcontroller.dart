import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/data/model/addressviewmodel.dart';
import 'package:get/get.dart';
import '../../core/class/requeststatus.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/address/addressdata.dart';

abstract class AddressViewController extends GetxController {
  gotoAddNewAddress();
  viewAdresses();
  initialData();
  deleteAdresses(String addressid);
}

class AddressViewControllerImp extends AddressViewController {
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  requeststatus requeststate = requeststatus.success;
  List<AdreesViewModel> data = [];

  @override
  gotoAddNewAddress() {
    Get.toNamed(Approutes.addNewAddress);
  }

  @override
  viewAdresses() async {
    requeststate = requeststatus.loading;
    update();
    var response = await addressData.viewAdress(
      "${myServices.sharedPrefs!.getString('id')}",
    );
    print("8888888888888viewAdress888888888$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => AdreesViewModel.fromJson(e)));
      } else {
        Get.snackbar("opps", "You didn't set any address");
      }
    } else {
      requeststate = requeststatus.serverFailaur;
    }
    update();
  }

  @override
  deleteAdresses(addressid) async {
    data.removeWhere((element) => element.addressId == addressid);
    update();
    var response = await addressData.deleteAdress(addressid);
    print(response);
  }

  @override
  initialData() {
    viewAdresses();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
