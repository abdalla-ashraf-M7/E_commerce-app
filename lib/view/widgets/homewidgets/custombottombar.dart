import 'package:e_commerce/controller/home/homescreencontroller.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomBarHome extends StatelessWidget {
  const CustomBottomBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HOmeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(controller.pagesinhome.length + 1, ((index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? const Spacer()
                  : MaterialButton(
                      onPressed: () {
                        controller.changepage(i);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(controller.titlepagesinhome[1][i], color: controller.currentpage == i ? Appcolors.primarycolor : Appcolors.night2, size: 30),
                          Text(
                            "${controller.titlepagesinhome[0][i]}",
                            style: TextStyle(fontSize: 18, color: controller.currentpage == i ? Appcolors.primarycolor : Appcolors.night2),
                          )
                        ],
                      ),
                    );
            }))
          ],
        ),
      ),
    );
  }
}
