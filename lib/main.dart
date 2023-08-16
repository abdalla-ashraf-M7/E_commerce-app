import 'package:e_commerce/bindings/bindings.dart';
import 'package:e_commerce/core/localization/changelocal.dart';
import 'package:e_commerce/core/localization/translation.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/routes.dart';

//import 'package:e_commerce/test.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialservices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageController languageController = Get.put(LanguageController());
    return GetMaterialApp(
      initialBinding: MyBindigs(),
      locale: languageController.langauge,
      translations: MyTranslations(),
      theme: languageController.apptheme,
      debugShowCheckedModeBanner: false,
      //home: const Test(),
      getPages: routes,
    );
  }
}
