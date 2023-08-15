import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/constant/applinks.dart';

class SignUpData {
  Crud crud = Crud();

  SignUpData(this.crud);

  getData(String username, String email, String password, String phone) async {
    var response = await crud.postData(AppLinks.signup, {
      "username": username,
      "email": email,
      "password": password,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
