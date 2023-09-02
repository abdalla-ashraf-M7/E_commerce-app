import 'package:e_commerce/core/class/requeststatus.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/remote/homedata.dart';
import 'package:e_commerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/approutes.dart';
import '../../core/functions/handlingdata.dart';
import '../../view/widgets/defaultdialog.dart';

abstract class HomeController extends MixSearchController {
  initialdata();
  viewData();
  catclick(int catnumber, String catname);
  gotofavorite();
  gotonotifications();
}

MyServices myServices = Get.find();
HomeData homeData = HomeData(Get.find());

class HomeControllerImp extends HomeController {
  String? id;
  String? username;
  List cats = [];
  List items = [];
  Map texthome = {};
  String titlehome = "";
  String bodyhome = "";
  String dileverytime = "";
  MyServices myServices = Get.find();

  @override
  viewData() async {
    requeststate = requeststatus.loading;
    update();
    cats.clear();
    items.clear();
    var response = await homeData.getData();
    print("333333333333333333333333$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response["status"] == "success") {
        cats.addAll(response['cats']);
        items.addAll(response['items']);
        texthome = response['text'];
        titlehome = texthome['text_titlehome'];
        bodyhome = texthome['text_bodyhome'];
        dileverytime = texthome['text_dileverytime'];
        myServices.sharedPrefs!.setString("dileverytime", dileverytime);
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

  refreshData() {
    viewData();
  }

  @override
  gotoitemsdetails(theModel) {
    Get.toNamed(Approutes.itemsdetails, arguments: {"itemmodel": theModel});
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

  @override
  gotofavorite() {
    Get.toNamed(Approutes.favorite);
  }

  @override
  gotonotifications() {
    Get.toNamed(Approutes.notifications);
  }
}

class MixSearchController extends GetxController {
  TextEditingController controllerhome = TextEditingController();
  bool isSearch = false;
  requeststatus requeststate = requeststatus.success;
  List<ItemsModel> searchlist = [];

  viewSearch() async {
    searchlist.clear();
    requeststate = requeststatus.loading;
    update();
    var response = await homeData.searchData(controllerhome.text);
    print("99999999999searchinhome999999999$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response["status"] == "success") {
        List resposedata = response['data'];
        searchlist.addAll(resposedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        Get.rawSnackbar(title: "Obss!!", message: "Sorry There is No products with this name");
      }
    } else {}
    update();
  }

  onWrite() {
    if (controllerhome.text == "" || controllerhome.text.isEmpty) {
      isSearch = false;
    }
    update();
  }

  onSearch() {
    if (controllerhome.text == "" || controllerhome.text.isEmpty) {
    } else {
      isSearch = true;
      viewSearch();
      update();
    }
  }

  onXpress() {
    FocusManager.instance.primaryFocus?.unfocus();
    controllerhome.text = "";
    isSearch = false;
    // Get.back();
    update();
  }

  gotoitemsdetails(theModel) {
    Get.toNamed(Approutes.itemsdetails, arguments: {"itemmodel": theModel});
  }

  @override
  void onInit() {
    super.onInit();
  }
}
