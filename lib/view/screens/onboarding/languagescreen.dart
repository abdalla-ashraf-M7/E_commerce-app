import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:e_commerce/core/localization/changelocal.dart';
import 'package:e_commerce/view/widgets/languagewidgets/custombuttonlanguage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends GetView<LanguageController> {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            Appimageassets.dots,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "1".tr,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButtonLanguage(
                  text: "2".tr,
                  press: () {
                    controller.changeLang("en");
                    Get.toNamed(Approutes.onboarding);
                  }),
              const SizedBox(
                height: 30,
              ),
              CustomButtonLanguage(
                  text: "3".tr,
                  press: () {
                    controller.changeLang("ar");
                    Get.toNamed(Approutes.onboarding);
                  }),
            ],
          ),
        ],
      )),
    );
  }
}
