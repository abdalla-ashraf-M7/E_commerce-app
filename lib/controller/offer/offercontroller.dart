import 'package:e_commerce/controller/home/homecontroller.dart';
import 'package:e_commerce/core/class/requeststatus.dart';
import 'package:e_commerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../../core/constant/approutes.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/offer/offerdata.dart';

abstract class OfferController extends MixSearchController {
  getOffers();
  initialData();
  gotofavorite();
}

class OfferControllerImp extends OfferController {
  int? catnumber;
  List<ItemsModel> data = [];
  requeststatus requeststate = requeststatus.success;
  OfferData offerData = OfferData(Get.find());
  MyServices myServices = Get.find();
  String dileverytime = "";

  @override
  getOffers() async {
    requeststate = requeststatus.loading;
    update();
    var response = await offerData.getData();
    print("9999999999getOffers$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response["status"] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        requeststate = requeststatus.failaur;
      }
    } else {}
    update();
  }

  @override
  initialData() {
    getOffers();
    dileverytime = myServices.sharedPrefs!.getString("dileverytime")!;
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  gotofavorite() {
    Get.toNamed(Approutes.favorite);
  }
}
