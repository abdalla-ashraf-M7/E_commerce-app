import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/constant/applinks.dart';

class VerifyCodeForgetPassData {
  Crud crud = Crud();
  VerifyCodeForgetPassData(this.crud);

  getData(String email, String verifycode) async {
    var response = await crud.postData(AppLinks.verifycodeforgetpass, {"email": email, "verifycode": verifycode});
    return response.fold((l) => l, (r) => r);
  }
}
