import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/constant/applinks.dart';
import 'package:get/get.dart';

class OrderDetailsData {
  Crud crud = Get.find();
  OrderDetailsData(this.crud);

  getOrderDetails(String orderid) async {
    var reponse = await crud.postData(AppLinks.orderdetails, {
      "orderid": orderid,
    });
    return reponse.fold((l) => l, (r) => r);
  }
}
