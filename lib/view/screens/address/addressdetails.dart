import 'package:e_commerce/controller/address/addressdetailscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/handlingdatview.dart';
import '../../widgets/authwidgets/custombodyauth.dart';
import '../../widgets/authwidgets/custombuttonauth.dart';
import '../../widgets/authwidgets/customtextformauth.dart';
import '../../widgets/authwidgets/customtitleauth.dart';

class AddressDetailsScreen extends StatelessWidget {
  const AddressDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressDetailsControllerImp());
    return Scaffold(
      appBar: AppBar(title: const Text("Address Details")),
      body: GetBuilder<AddressDetailsControllerImp>(
          builder: (controller) => HandlinDataView(
              requeststat: controller.requeststate,
              widget: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                child: ListView(
                  children: [
                    const SizedBox(height: 40),
                    const CustomTitleAuth(title: "Enter The Details"),
                    const SizedBox(height: 5),
                    const CustomBodyAuth(body: "Please Ensure That the ifo is right and it is Yours"),
                    const SizedBox(height: 20),
                    Form(
                        child: Column(
                      children: [
                        CustomTextFormAuth(
                          hint: "Enter The Address Name",
                          label: "Name",
                          icon: Icons.label_important_sharp,
                          textformcontroller: controller.name,
                        ),
                        const SizedBox(height: 30),
                        CustomTextFormAuth(
                          hint: "Enter The City Name",
                          label: "city",
                          icon: Icons.location_city,
                          textformcontroller: controller.city,
                        ),
                        const SizedBox(height: 30),
                        CustomTextFormAuth(
                          hint: "Enter The Street Name",
                          label: "Street",
                          icon: Icons.streetview_outlined,
                          textformcontroller: controller.street,
                        ),
                        const SizedBox(height: 30),
                      ],
                    )),
                    CustomButtonAuth(
                      text: "8".tr,
                      tap: () {
                        controller.AddNewAddress();
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ))
          //controller.requeststate == requeststatus.loading

          ),
    );
  }
}
