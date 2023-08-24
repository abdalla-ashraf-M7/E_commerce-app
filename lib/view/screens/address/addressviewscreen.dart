import 'package:e_commerce/controller/address/addressviewcontroller.dart';
import 'package:e_commerce/core/class/handlingdatview.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressViewScreen extends StatelessWidget {
  const AddressViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddressViewControllerImp controller = Get.put(AddressViewControllerImp());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.gotoAddNewAddress();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(
          "Address",
        ),
      ),
      body: GetBuilder<AddressViewControllerImp>(
          builder: (controller) => HandlinDataView(
              requeststat: controller.requeststate,
              widget: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                            title: Text(
                              "${controller.data[index].addressName}",
                              style: TextStyle(fontSize: 22, color: Appcolors.primarycolor),
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  "${controller.data[index].addressCity}",
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${controller.data[index].addressStreet}",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                controller.deleteAdresses("${controller.data[index].addressId}");
                              },
                              icon: Icon(Icons.delete, color: Appcolors.primarycolor),
                            )),
                      );
                    },
                  ),
                ),
              ))),
    );
  }
}
