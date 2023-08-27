import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/data/datasource/remote/orders/ordersdata.dart';
import 'package:get/get.dart';

import '../../core/class/requeststatus.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/address/addressdata.dart';
import '../../data/model/addressviewmodel.dart';

abstract class PaymentMethodController extends GetxController {
  viewAdresses();
  initialData();
  paymentMethod(String val);
  dileveryMehod(String val);
  whichAddress(String val);
  checkOut();
  gotoAddNewAddress();
}

class PaymentMethodControllerImp extends PaymentMethodController {
  AddressData addressData = AddressData(Get.find());
  OrderData orderData = OrderData(Get.find());
  MyServices myServices = Get.find();
  requeststatus requeststate = requeststatus.success;
  List<AdreesViewModel> data = [];
  String? paymentMethodV;
  String? dileveryMethodV;
  String? whichAddressV;
  late String rPriceAfterDiscount;
  late String rCopounId;
  late String rCopounDiscount;

  @override
  initialData() {
    rPriceAfterDiscount = Get.arguments['priceafterdiscount'];
    rCopounId = Get.arguments['copounid'];
    rCopounDiscount = Get.arguments['copoundiscount'];

    viewAdresses();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

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
    print("8888888888888viewAdressInPaymentmethod888888888$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => AdreesViewModel.fromJson(e)));
      } else {
        Get.snackbar("Warning", "You didn't set any address");
      }
    } else {
      requeststate = requeststatus.serverFailaur;
    }
    update();
  }

  @override
  dileveryMehod(String val) {
    dileveryMethodV = val;
    update();
  }

  @override
  paymentMethod(String val) {
    paymentMethodV = val;
    update();
  }

  @override
  whichAddress(String val) {
    whichAddressV = val;
    update();
  }

  late Map mapdatatocheckout = {
    "userid": myServices.sharedPrefs!.getString("id"),
    "addressid": whichAddressV ?? "0",
    "ordertype": dileveryMethodV,
    "paymentmethod": paymentMethodV,
    "price": rPriceAfterDiscount.toString(),
    "dileveryprice": "10",
    "copounid": rCopounId.toString(),
    "copoundiscount": rCopounDiscount.toString(),
  };
  @override
  checkOut() async {
    if (paymentMethodV == null) {
      return Get.snackbar("Warning", "You SHould Choose Payment Method");
    }
    if (dileveryMethodV == null) {
      return Get.snackbar("Warning", "You SHould Choose dilevery Method");
    }
    if (whichAddressV == null && dileveryMethodV == "1") {
      return Get.snackbar("Warning", "You SHould Choose An Address");
    }
    requeststate = requeststatus.loading;
    update();
    var response = await orderData.insertOrder(mapdatatocheckout);
    print("8888888888888checkoutPaymetnMethod888888888$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == 'success') {
        Get.snackbar("Congratolation", "Order successes");
        Get.offAllNamed(Approutes.homescreen);
      } else {
        Get.snackbar("Warning", "wrong");
      }
    } else {
      requeststate = requeststatus.serverFailaur;
    }

    update();
  }
}
