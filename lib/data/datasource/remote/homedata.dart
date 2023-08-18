import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/constant/applinks.dart';
import 'package:get/get.dart';

class HomeData {
  Crud crud = Get.find();
  HomeData(this.crud);

  getData() async {
    var reponse = await crud.postData(AppLinks.home, {});
    return reponse.fold((l) => l, (r) => r);
  }
}
