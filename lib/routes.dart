import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/view/screens/auth/login.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> routes = [
  GetPage(
    name: Approutes.login,
    page: () => const LogIn(),
  )
];
