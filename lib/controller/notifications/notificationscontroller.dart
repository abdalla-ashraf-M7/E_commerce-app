import 'package:e_commerce/data/datasource/remote/notifications/notificationdata.dart';
import 'package:e_commerce/data/model/notificationmodel.dart';
import 'package:get/get.dart';

import '../../core/class/requeststatus.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';

abstract class NotificatinsController extends GetxController {
  getNotifications();
  intitialData();
}

class NotificatinsControllerImp extends NotificatinsController {
  requeststatus requeststate = requeststatus.success;
  NotificationsData notificationsData = NotificationsData(Get.find());
  MyServices myServices = Get.find();
  List<NotificationModel> data = [];

  @override
  intitialData() {
    getNotifications();
  }

  @override
  void onInit() {
    intitialData();
    super.onInit();
  }

  @override
  getNotifications() async {
    requeststate = requeststatus.loading;
    update();
    var response = await notificationsData.getData(
      "${myServices.sharedPrefs!.getString('id')}",
    );
    print("8888888888888GetNotifications888888888$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == 'success') {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => NotificationModel.fromJson(e)));
      } else {
        requeststate = requeststatus.failaur;
      }
    } else {
      requeststate = requeststatus.serverFailaur;
    }
    update();
  }
}
