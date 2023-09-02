import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../controller/order/trakingcontroller.dart';
import '../../../core/class/handlingdatview.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrackingController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tracking'),
        ),
        body: GetBuilder<TrackingController>(
            builder: (pagecontroller) => HandlinDataView(
                  requeststat: pagecontroller.requeststate,
                  widget: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      if (pagecontroller.initPosition != null)
                        Column(
                          children: [
                            Expanded(
                              child: GoogleMap(
                                polylines: pagecontroller.polylinesetintraking,
                                markers: pagecontroller.markers.toSet(),
                                onTap: (latlng) {},
                                mapType: MapType.normal,
                                initialCameraPosition: pagecontroller.initPosition!,
                                onMapCreated: (GoogleMapController controller) {
                                  pagecontroller.gmController = controller;
                                },
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                )));
  }
}
