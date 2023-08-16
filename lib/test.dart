/* import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/core/functions/checkinternet.dart';
import 'package:e_commerce/view/widgets/defaultdialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool? result;
  initialcheckinternet() async {
    result = await checkINternet();
    print(result);
  }

  @override
  void initState() {
    initialcheckinternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Test")),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  defultDialog("Warning!!", "Content", "Confirm", "Cancel", () {}, () {});
                },
                child: Text("show dialog"))
          ],
        )));
  }
}

Future<bool> exitAlert() {
  Get.defaultDialog(
      barrierDismissible: true,
      radius: 20,
      title: "warning!!",
      titleStyle: const TextStyle(fontSize: 40, color: Appcolors.primarycolor),
      middleText: "Are You Sure That You Want To Exit The App?",
      middleTextStyle: const TextStyle(color: Appcolors.grey, fontSize: 20),
      actions: [
        TextButton(
            onPressed: () {},
            style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.amber)),
            child: const Text(
              "Cancle",
              style: TextStyle(color: Colors.red, fontSize: 28),
            )),
        const SizedBox(width: 40),
        TextButton(
            onPressed: () {},
            child: const Text(
              "Confirm",
              style: TextStyle(fontSize: 28),
            )),
      ]);
  return Future.value(true);
}
 */