import 'package:e_commerce/core/class/handlingdatview.dart';
import 'package:e_commerce/view/widgets/languagewidgets/custombuttonlanguage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/address/addnewaddresscontroller.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddNewAddressControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Address',
          style: TextStyle(fontSize: 26),
        ),
        centerTitle: true,
      ),
      body: Container(
          child: GetBuilder<AddNewAddressControllerImp>(
              builder: (pageController) => HandlinDataView(
                    requeststat: pageController.requeststate,
                    widget: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        if (pageController.kGooglePlex != null)
                          Column(
                            children: [
                              Expanded(
                                child: GoogleMap(
                                  markers: pageController.markers.toSet(),
                                  onTap: (latlng) {
                                    pageController.addmarker(latlng);
                                  },
                                  mapType: MapType.normal,
                                  initialCameraPosition: pageController.kGooglePlex!,
                                  onMapCreated: (GoogleMapController controller) {
                                    pageController.completercontroller!.complete(controller);
                                  },
                                ),
                              ),
                            ],
                          ),
                        Positioned(
                            bottom: 10,
                            child: CustomButtonLanguage(
                                text: "Confirm",
                                press: () {
                                  pageController.gotoAddressDetails();
                                }))
                      ],
                    ),
                  ))),
    );
  }
}
