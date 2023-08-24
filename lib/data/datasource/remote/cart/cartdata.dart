import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/constant/applinks.dart';
import 'package:get/get.dart';

class CartData {
  Crud crud = Get.find();
  CartData(this.crud);

  addCart(String userid, String itemid) async {
    var response = await crud.postData(AppLinks.addcart, {
      "userid": userid,
      "itemid": itemid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String userid, String itemid) async {
    var response = await crud.postData(AppLinks.deletecart, {
      "userid": userid,
      "itemid": itemid,
    });
    return response.fold((l) => l, (r) => r);
  }

  getcartcount(String userid, String itemid) async {
    var response = await crud.postData(AppLinks.getcartcount, {
      "userid": userid,
      "itemid": itemid,
    });
    return response.fold((l) => l, (r) => r);
  }

  cartview(String userid) async {
    var response = await crud.postData(AppLinks.viewcart, {
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  getCopoun(String name) async {
    var response = await crud.postData(AppLinks.copoun, {
      "name": name,
    });
    return response.fold((l) => l, (r) => r);
  }
}
