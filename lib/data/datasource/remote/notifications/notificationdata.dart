import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/constant/applinks.dart';
import 'package:get/get.dart';

class NotificationsData {
  Crud crud = Get.find();
  NotificationsData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLinks.notifications, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
