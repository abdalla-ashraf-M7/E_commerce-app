import 'package:e_commerce/controller/home/homecontroller.dart';
import 'package:e_commerce/core/class/requeststatus.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/remote/fav/myfavdata.dart';
import 'package:e_commerce/data/model/myfavmodel.dart';
import 'package:get/get.dart';
import '../../core/functions/handlingdata.dart';

abstract class FavController extends MixSearchController {
  addfav(String itemid);
  deletefav(String itemid);
  initialdata();
  setfav(String id, String val);
  getfav();
  deletefavfromfavscreen(String favid);
}

class FavControllerImp extends FavController {
  requeststatus requeststate = requeststatus.success;
  MyFavData myFavData = MyFavData(Get.find());
  MyServices myServices = Get.find();
  List<MyFavModel> myfavs = [];
  Map isfav = {};
  String dileverytime = "";

  @override
  initialdata() {
    if (myServices.sharedPrefs!.getString("dileverytime") != null) {
      dileverytime = myServices.sharedPrefs!.getString("dileverytime")!;
    }
  }

  @override
  void onInit() {
    initialdata();
    super.onInit();
  }

  @override
  addfav(itemid) async {
    requeststate = requeststatus.loading;
    update();
    var response = await myFavData.addFav("${myServices.sharedPrefs!.getString("id")}", itemid);
    print("55555555555555555555555555$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response["status"] == "success") {
        Get.rawSnackbar(title: "note", message: "added");
      } else {
        requeststate = requeststatus.failaur;
      }
    } else {}
    update();
  }

  @override
  deletefav(itemid) async {
    requeststate = requeststatus.loading;
    update();
    var response = await myFavData.deleteFav("${myServices.sharedPrefs!.getString("id")}", itemid);
    print("666666666666666666666$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response["status"] == "success") {
        Get.rawSnackbar(title: "note", message: "deleted");
      } else {
        requeststate = requeststatus.failaur;
      }
    } else {}
    update();
  }

  @override
  getfav() async {
    requeststate = requeststatus.loading;
    update();
    var response = await myFavData.getData("${myServices.sharedPrefs!.getString("id")}");
    print("7777777777777getfav77777777777777$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        myfavs.clear();
        myfavs.addAll(responsedata.map((e) => MyFavModel.fromJson(e)));
      } else {
        requeststate = requeststatus.failaur;
      }
    } else {
      requeststate = requeststatus.failaur;
    }
    update();
  }

  @override
  deletefavfromfavscreen(favid) {
    myFavData.deleteDataFromFavScreen(favid);

    myfavs.removeWhere((element) => element.favId == favid);

    update();
  }

  @override
  setfav(id, val) {
    isfav[id] = val;
    update();
  }
}
