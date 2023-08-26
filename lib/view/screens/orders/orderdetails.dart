import 'package:e_commerce/controller/order/orderdetailscontroller.dart';
import 'package:e_commerce/core/class/handlingdatview.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Order Details'),
        ),
        body: GetBuilder<OrderDetailsControllerImp>(
            builder: (pagecontroller) => HandlinDataView(
                  requeststat: pagecontroller.requeststate,
                  widget: Container(
                    alignment: AlignmentDirectional.center,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Card(
                            child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Table(
                            children: [
                              const TableRow(children: [
                                Text(
                                  "Item",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 23, color: Appcolors.primarycolor, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Quantity",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 23, color: Appcolors.primarycolor, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Price",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 23, color: Appcolors.primarycolor, fontWeight: FontWeight.bold),
                                )
                              ]),
                              ...List.generate(
                                pagecontroller.dataCartModel.length,
                                (index) => TableRow(children: [
                                  Text(
                                    "${pagecontroller.dataCartModel[index].itemsName}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    "${pagecontroller.dataCartModel[index].itemcountInOrder}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    "${pagecontroller.dataCartModel[index].itemsPrice}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                  )
                                ]),
                              )
                            ],
                          ),
                        )),
                        Card(
                          child: Text(
                            "Totla Price: ${pagecontroller.rOrderModel.ordersTotalprice} \$",
                            style: const TextStyle(color: Appcolors.primarycolor, fontSize: 23, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        if (pagecontroller.initPosition != null && pagecontroller.rOrderModel.ordersType == "1")
                          Column(
                            children: [
                              Card(
                                child: ListTile(
                                    title: Text(
                                      "${pagecontroller.rOrderModel.addressName}",
                                      style: const TextStyle(fontSize: 22, color: Appcolors.primarycolor),
                                    ),
                                    subtitle: Row(
                                      children: [
                                        Text(
                                          "${pagecontroller.rOrderModel.addressCity}",
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "${pagecontroller.rOrderModel.addressStreet}",
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    trailing: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.delete, color: Appcolors.primarycolor),
                                    )),
                              ),
                              Card(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  height: 350,
                                  width: double.infinity,
                                  child: GoogleMap(
                                    markers: pagecontroller.markers.toSet(),
                                    onTap: (latlng) {},
                                    mapType: MapType.normal,
                                    initialCameraPosition: pagecontroller.initPosition!,
                                    onMapCreated: (GoogleMapController controller) {
                                      if (!pagecontroller.completercontroller!.isCompleted) {
                                        pagecontroller.completercontroller!.complete(controller);
                                      }
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                      ],
                    ),
                  ),
                )));
  }
}
