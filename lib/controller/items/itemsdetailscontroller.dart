import 'package:e_commerce/core/class/requeststatus.dart';
import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/remote/cart/cartdata.dart';
import 'package:e_commerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ItemsDetailsController extends GetxController {
  intialData();
  plusonecart();
  minusonecart();
  addcart(itemid);
  deletecart(itemid);
  getCartCount(itemid);
  gotocart();
}

class ItemsDetailsControllerImp extends ItemsDetailsController {
  late ItemsModel recieveditemsModel;
  int cartcount = 0;
  late requeststatus requeststate;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();

  @override
  intialData() async {
    requeststate = requeststatus.loading;
    recieveditemsModel = Get.arguments['itemmodel'];
    cartcount = await getCartCount("${recieveditemsModel.itemsId}");
    // await getCartCount("${recieveditemsModel.itemsId}");

    requeststate = requeststatus.success;
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  gotocart() {
    Get.toNamed(Approutes.cart);
  }

  @override
  getCartCount(itemid) async {
    requeststate = requeststatus.loading;
    update();
    var response = await cartData.getcartcount("${myServices.sharedPrefs!.getString('id')}", itemid);
    print("77777777777getcountinitemdetatils7777777777777$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == 'success') {
        int cartcount = int.parse(response['count']);
        print("**************************************");
        print(cartcount);
        return cartcount;
      } else {
        requeststate = requeststatus.failaur;
      }
    } else {
      requeststate = requeststatus.serverFailaur;
    }
    update();
  }

  @override
  addcart(itemid) async {
    // requeststate = requeststatus.loading;

    var response = await cartData.addCart("${myServices.sharedPrefs!.getString('id')}", itemid);
    print("77777777777777777cartaddinitemdetails77777777777$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == 'success') {
        // Get.rawSnackbar(duration: Duration(milliseconds: 1000), title: "message", message: "added to cart");
      } else {
        requeststate = requeststatus.failaur;
      }
    } else {
      requeststate = requeststatus.serverFailaur;
    }
    update();
  }

  @override
  deletecart(itemid) async {
    //requeststate = requeststatus.loading;
    var response = await cartData.deleteCart("${myServices.sharedPrefs!.getString('id')}", itemid);
    print("777777777777777777777cartdeleteinitemdetails7777777777$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == 'success') {
        //Get.rawSnackbar(duration: Duration(milliseconds: 1000), title: "message", message: "removed from cart");
      } else {
        requeststate = requeststatus.failaur;
      }
    } else {
      requeststate = requeststatus.serverFailaur;
    }
    update();
  }

  @override
  plusonecart() {
    addcart("${recieveditemsModel.itemsId}");
    cartcount++;
    update();
  }

  @override
  minusonecart() {
    if (cartcount > 0) {
      deletecart("${recieveditemsModel.itemsId}");
      cartcount--;
      update();
    }
  }
}
