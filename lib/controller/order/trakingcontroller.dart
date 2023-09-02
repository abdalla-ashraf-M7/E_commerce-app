import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/class/requeststatus.dart';
import '../../core/functions/checkperlocation.dart';
import '../../core/functions/getdecodepolyline.dart';
import '../../core/services/services.dart';
import '../../data/model/ordersmodel.dart';

class TrackingController extends GetxController {
  MyServices myServices = Get.find();
  late OrdersModel rrOrderModel;
  GoogleMapController? gmController;
  CameraPosition? initPosition;
  List<Marker> markers = [];
  requeststatus requeststate = requeststatus.success;
  double? currentlat;
  double? currentlong;
  double? dstlat;
  double? dstlong;
  bool isPolylineDrawn = false;
  String? rLocationStatus;
  Set<Polyline> polylinesetintraking = {};

  @override
  void onInit() async {
    rLocationStatus = await requestPerLofcation();
    initialData();
    super.onInit();
  }

  initialData() {
    if (rLocationStatus != "0" && rLocationStatus != "1" && rLocationStatus != "2") {
      rrOrderModel = Get.arguments['ordermodel'];
      addmarker(LatLng(double.parse("${rrOrderModel.addressLat}"), double.parse("${rrOrderModel.addressLong}")), "customer");
      getDeliveryPosition();
    }
  }

/*  markers.removeWhere(
        (element) => element.markerId == const MarkerId("current"),
      );
      addmarker(LatLng(currentlat!, currentlong!), "current");
      update(); */
  getDeliveryPosition() {
    FirebaseFirestore.instance.collection("delivery").doc(rrOrderModel.ordersId).snapshots().listen((event) async {
      currentlat = double.parse(rrOrderModel.addressLat!);
      currentlong = double.parse(rrOrderModel.addressLong!);
      dstlat = event.get("lat");
      dstlong = event.get("long");
      initPosition = CameraPosition(
        target: LatLng(currentlat!, currentlong!),
        zoom: 11,
      );
      addmarker(LatLng(dstlat!, dstlong!), "delivery");
      polylinesetintraking = await getpolyline(dstlat, dstlong, currentlat, currentlong);
      update();
      print("^^^^^^^^^^^^^^^^^getdeliveryposiotion^^^^^^^^");
    });
  }

  initialPolyline() async {
    isPolylineDrawn = true;
    print("))))))))))))))))))))");
    update();
  }

  addmarker(latLng, id) {
    markers.add(Marker(markerId: MarkerId(id), position: latLng));
    update();
  }

  @override
  void onClose() {
    if (gmController != null) {
      gmController!.dispose();
    }

    super.onClose();
  }
}
