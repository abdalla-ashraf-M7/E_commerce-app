import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/constant/applinks.dart';
import 'package:get/get.dart';

class MyFavData {
  Crud crud = Get.find();
  MyFavData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLinks.myfav, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  deleteDataFromFavScreen(String favid) async {
    var response = await crud.postData(AppLinks.deletefavfromfavscreen, {"favid": favid});
    return response.fold((l) => l, (r) => r);
  }

  deleteFav(String userid, String itemid) async {
    var response = await crud.postData(AppLinks.deletefav, {"userid": userid, "itemid": itemid});
    return response.fold((l) => l, (r) => r);
  }

  addFav(String userid, String itemid) async {
    var response = await crud.postData(AppLinks.addfav, {"userid": userid, "itemid": itemid});
    return response.fold((l) => l, (r) => r);
  }
}
