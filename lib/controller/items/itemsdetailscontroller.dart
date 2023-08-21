import 'package:e_commerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ItemsDetailsController extends GetxController {
  intialData();
}

class ItemsDetailsControllerImp extends ItemsDetailsController {
  late ItemsModel recieveditemsModel;

  @override
  intialData() {
    recieveditemsModel = Get.arguments['itemmodel'];
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
