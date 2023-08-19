import 'package:e_commerce/core/class/requeststatus.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/remote/homedata.dart';
import 'package:get/get.dart';

import '../../core/constant/approutes.dart';
import '../../core/functions/handlingdata.dart';
import '../../view/widgets/defaultdialog.dart';

abstract class HomeController extends GetxController {
  initialdata();
  viewData();
  catclick(int catnumber, String catname);
}

MyServices myServices = Get.find();
HomeData homeData = HomeData(Get.find());

class HomeControllerImp extends HomeController {
  String? id;
  String? username;
  requeststatus requeststate = requeststatus.success;
  List cats = [];
  List items = [];

  @override
  viewData() async {
    requeststate = requeststatus.loading;
    update();
    var response = await homeData.getData();
    print("333333333333333333333333$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response["status"] == "success") {
        cats.addAll(response['cats']);
        items.addAll(response['items']);
      } else {
        requeststate = requeststatus.failaur;
        defultDialog("Warning!!", "Email or Phone is already used", "Cancle", "Try Again", 60, 10, () {
          Get.offAllNamed(Approutes.login);
        }, () {
          Get.back();
        });
      }
    } else {}
    update();
  }

  @override
  initialdata() {
    id = myServices.sharedPrefs!.getString("id");
    username = myServices.sharedPrefs!.getString("username");
  }

  @override
  void onInit() {
    initialdata();
    viewData();
    super.onInit();
  }

  @override
  catclick(catnumber, catname) {
    Get.toNamed(Approutes.items, arguments: {
      "catlist": cats,
      "catnumber": catnumber,
      "catname": catname,
    });
  }
}
