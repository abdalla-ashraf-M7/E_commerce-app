import 'package:e_commerce/controller/test_datacontroller.dart';
import 'package:e_commerce/core/class/handlingdatview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Test extends StatelessWidget {
  Test({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: GetBuilder<TestController>(
              builder: (pageController) => HandlinDataView(
                    requeststat: pageController.requeststate,
                    widget: Column(
                      children: [
                        if (pageController.kGooglePlex != null)
                          Expanded(
                            child: GoogleMap(
                              mapType: MapType.normal,
                              initialCameraPosition: pageController.kGooglePlex!,
                              onMapCreated: (GoogleMapController controller) {
                                pageController.completercontroller!.complete(controller);
                              },
                            ),
                          ),
                      ],
                    ),
                  ))),
    );
  }
}
