/* import 'package:e_commerce/core/class/requeststatus.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

class TestDataController extends GetxController {
  TestData testData = TestData(Get.find());

  late requeststatus requeststate;
  List data = [];

  getData2() async {
    requeststate = requeststatus.loading;
    var response = await testData.getData();
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response["status"] == "success") {
        data.addAll(response['data']);
      } else {
        requeststate = requeststatus.failaur;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData2();
    super.onInit();
  }
}
 */