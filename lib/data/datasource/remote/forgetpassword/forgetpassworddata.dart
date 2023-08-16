import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/constant/applinks.dart';

class ForgetPasswordData {
  Crud crud = Crud();
  ForgetPasswordData(this.crud);

  getData(String email) async {
    var response = await crud.postData(AppLinks.forgetpassword, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
