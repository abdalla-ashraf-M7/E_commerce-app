import 'package:e_commerce/controller/order/archiveordercontroller.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

showRating(BuildContext context, String orderid) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: const Text(
        'Rating',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),

      message: const Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 19),
      ),
      // your app's logo?
      image: Image.asset(
        Appimageassets.logo,
        height: 150,
        width: 150,
      ),
      submitButtonText: 'Submit',

      submitButtonTextStyle: const TextStyle(color: Appcolors.primarycolor, fontWeight: FontWeight.bold),
      commentHint: 'Enter whatever in your head , we are interrested',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        //   print('rating: ${response.rating}, comment: ${response.comment}');
        ArchiveOrderControllerImp controller = Get.find();
        controller.rateOrder(orderid, response.rating.toString(), response.comment);
      },
    ),
  );
}
