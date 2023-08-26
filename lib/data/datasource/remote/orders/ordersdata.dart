import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/constant/applinks.dart';
import 'package:get/get.dart';

class OrderData {
  Crud crud = Get.find();
  OrderData(this.crud);

  insertOrder(Map data) async {
    var reponse = await crud.postData(AppLinks.checkout, data);
    return reponse.fold((l) => l, (r) => r);
  }

  getOrders(String userid) async {
    var reponse = await crud.postData(AppLinks.myOrders, {
      "userid": userid,
    });
    return reponse.fold((l) => l, (r) => r);
  }

  deleteOrders(String orderid) async {
    var reponse = await crud.postData(AppLinks.orderDelete, {
      "orderid": orderid,
    });
    return reponse.fold((l) => l, (r) => r);
  }

  archiveOrders(String userid) async {
    var reponse = await crud.postData(AppLinks.orderArchive, {
      "userid": userid,
    });
    return reponse.fold((l) => l, (r) => r);
  }
}
