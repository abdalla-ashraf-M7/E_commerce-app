import 'package:e_commerce/core/class/requeststatus.dart';
import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/remote/items/itemsdata.dart';
import 'package:e_commerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initialdata();
  changecatnumber(int i);
  getItems();
  gotoitemsdetails(ItemsModel theModel);
  filterlist(String catname);
  gotofavorite();
}

class ItemsControllerImp extends ItemsController {
  int? catnumber;
  List cats = [];
  List items = [];
  MyServices myServices = Get.find();

  @override
  void onInit() {
    initialdata();
    super.onInit();
  }

  @override
  initialdata() async {
    catnumber = Get.arguments['catnumber'];
    cats.addAll(Get.arguments['catlist']);
    getItems();
  }

  @override
  changecatnumber(i) {
    catnumber = i;
    update();
  }

  requeststatus? requeststate;
  ItemsData itemsData = ItemsData(Get.find());
  @override
  getItems() async {
    requeststate = requeststatus.loading;
    update();
    var response = await itemsData.getData("${myServices.sharedPrefs!.getString("id")}");
    print("444444444444444444444444$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response["status"] == "success") {
        items.addAll(response['data']);

        filterlist((Get.arguments['catname']));
      } else {
        requeststate = requeststatus.failaur;
      }
    } else {}
    update();
  }

  List pickedOne = [];
  @override
  filterlist(catname) {
    pickedOne.clear();
    for (var i = 0; i < items.length; i++) {
      if (items[i]['cats_name'] == catname) {
        pickedOne.add(items[i]);
      }
    }
  }

  @override
  gotoitemsdetails(theModel) {
    Get.toNamed(Approutes.itemsdetails, arguments: {"itemmodel": theModel});
  }

  @override
  gotofavorite() {
    Get.toNamed(Approutes.favorite);
  }
}
