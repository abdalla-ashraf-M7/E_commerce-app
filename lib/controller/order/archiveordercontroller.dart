import 'package:e_commerce/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import '../../core/class/requeststatus.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/orders/ordersdata.dart';

abstract class ArchiveOrderController extends GetxController {
  geArchivedtOrders();
  initalData();
  rateOrder(String orderid, String rating, String comment);
  refreshMyOrderspage();
}

class ArchiveOrderControllerImp extends ArchiveOrderController {
  OrderData orderData = OrderData(Get.find());
  MyServices myServices = Get.find();
  requeststatus requeststate = requeststatus.success;
  List<OrdersModel> data = [];

  @override
  initalData() {
    geArchivedtOrders();
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }

  @override
  geArchivedtOrders() async {
    requeststate = requeststatus.loading;
    update();
    data.clear();
    var response = await orderData.archiveOrders(
      "${myServices.sharedPrefs!.getString('id')}",
    );
    print("8888888888888ArchivedOrders888888888$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => OrdersModel.fromJson(e)));
      } else {
        requeststate = requeststatus.failaur;
      }
    } else {
      requeststate = requeststatus.serverFailaur;
    }
    update();
  }

  @override
  rateOrder(orderid, rating, comment) async {
    requeststate = requeststatus.loading;
    update();
    //data.clear();
    var response = await orderData.orderRating(orderid, rating, comment);
    print("8888888888888rateOrders888888888$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == 'success') {
        geArchivedtOrders();
        Get.rawSnackbar(title: "Success", message: "Thank you for rating");
      } else {
        requeststate = requeststatus.failaur;
      }
    } else {
      requeststate = requeststatus.serverFailaur;
    }
    update();
  }

  @override
  refreshMyOrderspage() {
    geArchivedtOrders();
  }
}