import 'package:get/get.dart';
import 'package:helmet_customer/utils/routes/routes_string.dart';
import 'package:helmet_customer/views/auth/login/login_binding.dart';
import 'package:helmet_customer/views/auth/login/login_screen/login_screen.dart';
import 'package:helmet_customer/views/home/home_screen/home_screen.dart';
import 'package:helmet_customer/views/home/home_binding.dart';
import 'package:helmet_customer/views/splash_screen/splash_screen_binding.dart';

import 'package:helmet_customer/views/splash_screen/splash_screen.dart';


class RouteClass {
  static List<GetPage> routs = [
 
    GetPage(
      name: RoutesString.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
 
    GetPage(
      name: RoutesString.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    
    GetPage(
      name: RoutesString.splash,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
