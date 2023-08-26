import 'dart:async';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/remote/orders/orderdetailsdata.dart';
import 'package:e_commerce/data/model/cartviewmodel.dart';
import 'package:e_commerce/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/class/requeststatus.dart';
import '../../core/functions/handlingdata.dart';

abstract class OrderDetailsController extends GetxController {
  initialData();
  initialposition();
  addmarker(LatLng latLng);
  getOrderDetails();
}

class OrderDetailsControllerImp extends OrderDetailsController {
  late OrdersModel rOrderModel;
  Completer<GoogleMapController>? completercontroller;
  CameraPosition? initPosition;
  List<Marker> markers = [];
  requeststatus requeststate = requeststatus.success;
  OrderDetailsData orderDetailsData = OrderDetailsData(Get.find());
  MyServices myServices = Get.find();
  List<CartViewModel> dataCartModel = [];

  @override
  initialData() async {
    rOrderModel = Get.arguments['ordermodel'];
    if (rOrderModel.ordersType == "1") {
      await initialposition();
      addmarker(LatLng(double.parse("${rOrderModel.addressLat}"), double.parse("${rOrderModel.addressLong}")));
      completercontroller = Completer<GoogleMapController>();
    }
    getOrderDetails();
  }

  @override
  void onInit() {
    initialData();

    super.onInit();
  }

  @override
  getOrderDetails() async {
    requeststate = requeststatus.loading;
    update();
    dataCartModel.clear();
    var response = await orderDetailsData.getOrderDetails(
      "${rOrderModel.ordersId}",
    );
    print("99999999999999999getorderdetails$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];
        dataCartModel.addAll(responsedata.map((e) => CartViewModel.fromJson(e)));
      } else {
        requeststate = requeststatus.failaur;
      }
    } else {
      requeststate = requeststatus.serverFailaur;
    }
    update();
  }

  @override
  initialposition() async {
    initPosition = CameraPosition(
      target: LatLng(double.parse("${rOrderModel.addressLat}"), double.parse("${rOrderModel.addressLong}")),
      zoom: 10,
    );
    requeststate = requeststatus.success;
    update();
  }

  @override
  addmarker(latLng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId('1'), position: latLng));
    update();
  }
}
