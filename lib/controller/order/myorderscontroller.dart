import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import '../../core/class/requeststatus.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/orders/ordersdata.dart';

abstract class MyOrdersController extends GetxController {
  getOrders();
  initalData();
  String rPaymentMethod(String val);
  String rOrderType(String val);
  String rOrderStatus(String val);
  refreshMyOrderspage();
  gotoDetails(int i);
  goToTrakingOrders(OrdersModel ordersModel);
  deleteOrder(String orderid);
}

class MyOrdersControllerImp extends MyOrdersController {
  OrderData orderData = OrderData(Get.find());
  MyServices myServices = Get.find();
  requeststatus requeststate = requeststatus.success;
  List<OrdersModel> data = [];

  @override
  initalData() {
    getOrders();
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }

  @override
  getOrders() async {
    requeststate = requeststatus.loading;
    update();
    data.clear();
    var response = await orderData.getOrders(
      "${myServices.sharedPrefs!.getString('id')}",
    );
    print("8888888888888getOrders888888888$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => OrdersModel.fromJson(e)));
      } else {
        requeststate = requeststatus.failaur;
      }
    } else {}
    update();
  }

  @override
  deleteOrder(orderid) async {
    requeststate = requeststatus.loading;
    update();
    var response = await orderData.deleteOrders(
      orderid,
    );
    print("8888888888888deleteorder888888888$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(title: "Good", message: "the Order is deleted");
        refreshMyOrderspage();
      } else {
        Get.rawSnackbar(title: "Sorry", message: "the Order is not deleted");
      }
    } else {}
    update();
  }

  @override
  String rOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "Preparing";
    } else if (val == "2") {
      return "Dilevery Guy Recieved";
    } else if (val == "3") {
      return "On the way";
    } else {
      return "Archived";
    }
  }

  @override
  String rOrderType(String val) {
    if (val == "1") {
      return "Dilevery";
    } else {
      return "Drive Thru";
    }
  }

  @override
  String rPaymentMethod(String val) {
    if (val == "0") {
      return "Cash";
    } else {
      return "Card";
    }
  }

  @override
  refreshMyOrderspage() {
    getOrders();
  }

  @override
  gotoDetails(i) {
    Get.toNamed(Approutes.orderdetails, arguments: {"ordermodel": data[i]});
  }

  @override
  goToTrakingOrders(ordersModel) {
    Get.toNamed(Approutes.trackOrder, arguments: {"ordermodel": ordersModel});
  }
}
