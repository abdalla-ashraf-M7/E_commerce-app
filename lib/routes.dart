import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/view/screens/auth/login.dart';
import 'package:e_commerce/view/screens/auth/signup.dart';
import 'package:e_commerce/view/screens/languagescreen.dart';
import 'package:e_commerce/view/screens/onboardingscreen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> routes = [
  GetPage(
    name: Approutes.login,
    page: () => const LogInScreen(),
  ),
  GetPage(
    name: Approutes.onboarding,
    page: () => const OnBoardingScreen(),
  ),
  GetPage(
    name: Approutes.language,
    page: () => const LanguageScreen(),
  ),
  GetPage(
    name: Approutes.signup,
    page: () => const SignUpScreen(),
  ),
];
