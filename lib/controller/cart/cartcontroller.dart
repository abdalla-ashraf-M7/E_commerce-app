import 'package:e_commerce/core/class/requeststatus.dart';
import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/remote/cart/cartdata.dart';
import 'package:e_commerce/data/model/cartviewmodel.dart';
import 'package:e_commerce/data/model/copounmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  addcart(String itemid);
  deletecart(String itemid);
  getCartCount(String itemid);
  cartVeiw();
  initialData();
  gotocart();
  refreshcart();
  getCopoun(String name);
  gotoOrder();
  // plusonecart(int i);
  // minusonecart(int i);
}

class CartControllerImp extends CartController {
  CartData cartData = CartData(Get.find());
  late requeststatus requeststate;
  MyServices myServices = Get.find();
  List<CartViewModel> data = [];
  double databaseCartTatalprice = 0.0;
  double databaseCartTatalpriceAfterDiscount = 0.0;
  double copoundiscount = 0.0;
  int databaseCartCount = 0;
  CopounModel? copounModel;
  TextEditingController? copouncontroller;
  bool isCopounValid = false;
  GlobalKey<FormState>? copounkey;
  String? copounId;

  @override
  initialData() {
    cartVeiw();
    copounModel = CopounModel();
    copouncontroller = TextEditingController();
    copounkey = GlobalKey<FormState>();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  cartVeiw() async {
    requeststate = requeststatus.loading;
    update();
    var response = await cartData.cartview("${myServices.sharedPrefs!.getString('id')}");
    print("8888888888888cartview888888888$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == 'success') {
        if (response['data']['status'] == 'success') {
          List responsedata = response['data']['data'];
          data.addAll(responsedata.map((e) => CartViewModel.fromJson(e)));
          databaseCartTatalprice = double.parse(response['countprice']['itemtotalprice']);
          databaseCartTatalpriceAfterDiscount = double.parse(response['countprice']['itemtotalpriceafterdiscount']);
          databaseCartCount = int.parse(response['countprice']['totalcount']);
          print("++++++++++++++++++++++++++++${databaseCartTatalprice}");
        }
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
    requeststate = requeststatus.loading;
    var response = await cartData.addCart("${myServices.sharedPrefs!.getString('id')}", itemid);
    print("8888888888888addtocart888888888$response");
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
  }

  @override
  deletecart(itemid) async {
    requeststate = requeststatus.loading;
    var response = await cartData.deleteCart("${myServices.sharedPrefs!.getString('id')}", itemid);
    print("8888888888888deletetocart888888888$response");
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
  getCartCount(itemid) async {
    requeststate = requeststatus.loading;
    var response = await cartData.getcartcount("${myServices.sharedPrefs!.getString('id')}", itemid);
    print("8888888888888getcartcount888888888$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == 'success') {
        int cartcount = int.parse(response['count']);
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
  getCopoun(name) async {
    if (copounkey!.currentState!.validate()) {
      requeststate = requeststatus.loading;
      update();
      var response = await cartData.getCopoun(name);
      print("8888888888888getCopoun888888888$response");
      requeststate = handlingData(response);
      if (requeststate == requeststatus.success) {
        if (response['status'] == 'success') {
          Map<String, dynamic> responedata = response['data'];
          copounModel = CopounModel.fromJson(responedata);
          isCopounValid = true;
          copoundiscount = double.parse("${copounModel!.copounDiscount}");
          copounId = "${copounModel!.copounId}";
        } else {
          Get.rawSnackbar(title: "Sorry", message: "this Copoun is't Valid");
        }
      } else {
        requeststate = requeststatus.serverFailaur;
      }
      copouncontroller!.text = '';
      update();
    }
  }

  @override
  gotocart() {
    refreshcart();
    Get.toNamed(Approutes.cart);
  }

  @override
  refreshcart() {
    data.clear();
    databaseCartCount = 0;
    databaseCartTatalprice = 0.0;
    databaseCartTatalpriceAfterDiscount = 0.0;
    copoundiscount = 0.0;
    cartVeiw();
  }

  @override
  gotoOrder() {
    if (!data.isEmpty) {
      Get.toNamed(Approutes.checkout, arguments: {
        "copounid": copounId ?? '0',
        "priceafterdiscount": databaseCartTatalpriceAfterDiscount.toString(),
        "copoundiscount": copoundiscount.toString(),
      });
    } else {
      Get.snackbar("Warning", "The Cart is Empty please add some products", backgroundColor: Appcolors.primarycolor, colorText: Appcolors.white);
    }
  }
//i made them trying to remove the loading in cart screen when add adn remove lidke itemsdetails
/*   @override
  plusonecart(i) {
    addcart("${data[i].itemsId}");
    itemcount = int.parse("${data[i].itemsCount}");
    itemcount++;
    update();
  }

  @override
  minusonecart(i) {
    if (itemcount > 0) {
      deletecart("${data[i].itemsId}");
      itemcount = int.parse("${data[i].itemsCount}");
      itemcount--;
      update();
    }
  } */
}
