import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/constant/applinks.dart';
import 'package:get/get.dart';

class OfferData {
  Crud crud = Get.find();
  OfferData(this.crud);

  getData() async {
    var reponse = await crud.postData(AppLinks.offer, {});
    return reponse.fold((l) => l, (r) => r);
  }
}
