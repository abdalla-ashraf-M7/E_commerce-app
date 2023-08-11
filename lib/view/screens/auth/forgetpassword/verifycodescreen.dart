import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:e_commerce/view/widgets/authwidgets/custombodyauth.dart';
import 'package:e_commerce/view/widgets/authwidgets/customrowsignupauth.dart';

import 'package:e_commerce/view/widgets/authwidgets/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/forgetpasswordcontrollers/verifycodecontroller.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar: AppBar(
        backgroundColor: Appcolors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Verify Code",
          style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Appcolors.grey2),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        width: double.infinity,
        child: ListView(
          children: [
            const SizedBox(height: 30),
            Image.asset(
              Appimageassets.newlogo,
              height: 100,
            ),
            const SizedBox(height: 30),
            const CustomTitleAuth(title: "Verify Your Email"),
            const SizedBox(height: 20),
            const CustomBodyAuth(body: "Chek Your Email And Enter The Code, Then You Can Resset Your Password"),
            const SizedBox(height: 30),
            OtpTextField(
              fieldWidth: 55,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor: const Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
                print("************$code");
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                controller.gotoressetpassword();
              }, // end onSubmit
            ),
            const SizedBox(height: 30),
            CustomRowSignAuth(text1: "didn't recieve a code?", text2: " Resend Code", tap: () {})
          ],
        ),
      ),
    );
  }
}
