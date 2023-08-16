import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/constant/applinks.dart';

class RessetPasswordData {
  Crud crud = Crud();
  RessetPasswordData(this.crud);

  getData(String email, String password) async {
    var response = await crud.postData(AppLinks.ressetpassword, {"email": email, "password": password});
    return response.fold((l) => l, (r) => r);
  }
}
