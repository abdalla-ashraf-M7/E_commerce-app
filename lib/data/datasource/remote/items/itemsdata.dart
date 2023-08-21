import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/constant/applinks.dart';
import 'package:get/get.dart';

class ItemsData {
  Crud crud = Get.find();
  ItemsData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLinks.items, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
