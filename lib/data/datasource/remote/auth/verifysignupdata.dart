import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/constant/applinks.dart';

class VerifySignupData {
  Crud crud = Crud();
  VerifySignupData(this.crud);

  getData(String email, String verifycode) async {
    var response = await crud.postData(AppLinks.verifysignup, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
