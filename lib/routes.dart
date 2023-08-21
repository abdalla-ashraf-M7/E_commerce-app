import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/core/middleware/mymiddleware.dart';
import 'package:e_commerce/data/datasource/remote/test_data.dart';
import 'package:e_commerce/test.dart';
import 'package:e_commerce/view/screens/auth/forgetpassword/forgetpasswordscreen.dart';
import 'package:e_commerce/view/screens/auth/forgetpassword/sucessressetpasswordscreen.dart';
import 'package:e_commerce/view/screens/auth/login.dart';
import 'package:e_commerce/view/screens/auth/forgetpassword/resetpasswordscreen.dart';
import 'package:e_commerce/view/screens/auth/signup.dart';
import 'package:e_commerce/view/screens/auth/forgetpassword/verifycodescreen.dart';
import 'package:e_commerce/view/screens/auth/sucesssignupscreen.dart';
import 'package:e_commerce/view/screens/auth/verifycodesinupscreen.dart';
import 'package:e_commerce/view/screens/favorite/myfavscreen.dart';
import 'package:e_commerce/view/screens/pagesinhomescreen/home.dart';
import 'package:e_commerce/view/screens/homescreen.dart';
import 'package:e_commerce/view/screens/items/itemsdetails.dart';
import 'package:e_commerce/view/screens/items/itemsscreen.dart';
import 'package:e_commerce/view/screens/onboarding/languagescreen.dart';
import 'package:e_commerce/view/screens/onboarding/onboardingscreen.dart';
import 'package:e_commerce/view/test_datascreen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: Approutes.language, page: () => const LanguageScreen(), middlewares: [MyMiddleWare()]),
  GetPage(name: Approutes.login, page: () => const LogInScreen()),
  //GetPage(name: "/", page: () => const Test()),

  GetPage(name: Approutes.onboarding, page: () => const OnBoardingScreen()),

  GetPage(name: Approutes.signup, page: () => const SignUpScreen()),
  GetPage(name: Approutes.forgetpassword, page: () => const ForgetPasswordScreen()),
  GetPage(name: Approutes.verifycode, page: () => const VerifyCodeScreen()),
  GetPage(name: Approutes.ressetpassword, page: () => const RessetPasswordScreen()),
  GetPage(name: Approutes.verifyemailsignup, page: () => const VerifyEmailSignupScreen()),
  GetPage(name: Approutes.sucesssignup, page: () => const ScuccessSignUpScreen()),
  GetPage(name: Approutes.sucessressetpassword, page: () => const ScuccessRessetPasswordScreen()),
  GetPage(name: Approutes.homescreen, page: () => const HomeScreen()),
  GetPage(name: Approutes.items, page: () => const ItemsScreen()),
  GetPage(name: Approutes.itemsdetails, page: () => const ItemsDetailsScreen()),
  GetPage(name: Approutes.favorite, page: () => const MyfavScreen()),
];
