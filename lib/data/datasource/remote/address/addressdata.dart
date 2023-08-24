import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/constant/applinks.dart';

class AddressData {
  Crud crud = Crud();
  AddressData(this.crud);

  viewAdress(String userid) async {
    var response = await crud.postData(AppLinks.addressView, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  addAdress(
    String userid,
    String name,
    String city,
    String street,
    String lat,
    String long,
  ) async {
    var response = await crud.postData(AppLinks.addressAdd, {
      "userid": userid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteAdress(String addressid) async {
    var response = await crud.postData(AppLinks.addressDelete, {"addressid": addressid});
    return response.fold((l) => l, (r) => r);
  }

  editAdress(
    String addressid,
    String name,
    String city,
    String street,
    String lat,
    String long,
  ) async {
    var response = await crud.postData(AppLinks.addressEdit, {
      "addressid": addressid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }
}
