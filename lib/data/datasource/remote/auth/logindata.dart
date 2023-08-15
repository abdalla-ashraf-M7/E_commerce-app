import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/constant/applinks.dart';

class LoginData {
  Crud crud = Crud();

  LoginData(this.crud);

  getData(String email, String password) async {
    var response = await crud.postData(AppLinks.login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
