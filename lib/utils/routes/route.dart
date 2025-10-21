import 'package:get/get.dart';
import 'package:helmet_customer/utils/routes/routes_string.dart';
import 'package:helmet_customer/views/auth/login/login_binding.dart';
import 'package:helmet_customer/views/auth/login/login_screen/login_screen.dart';
import 'package:helmet_customer/views/editprofile/edit.dart';
import 'package:helmet_customer/views/editprofile/edit_binding.dart';
import 'package:helmet_customer/views/editprofile/edit_page.dart';
import 'package:helmet_customer/views/fawater/fawater.dart';
import 'package:helmet_customer/views/fawater/fawater_binding.dart';
import 'package:helmet_customer/views/feedback/binding/feedback_binding.dart';
import 'package:helmet_customer/views/feedback/screen/feedback_screen.dart';
import 'package:helmet_customer/views/Packages/Packages.dart';
import 'package:helmet_customer/views/Packages/Packages_binding.dart';
import 'package:helmet_customer/views/helps/helps.dart';
import 'package:helmet_customer/views/helps/helps_binding.dart';
import 'package:helmet_customer/views/home/home_screen/home_screen.dart';
import 'package:helmet_customer/views/home/home_binding.dart';
import 'package:helmet_customer/views/profile/binding/profile_screen_binding.dart';
import 'package:helmet_customer/views/profile/settings_screen.dart';
import 'package:helmet_customer/views/reservations/binding/reservation_binding.dart';
import 'package:helmet_customer/views/reservations/screen/reservation_screen.dart';
import 'package:helmet_customer/views/setting/binding/setting_binding.dart';
import 'package:helmet_customer/views/setting/screen/setting_screen.dart';
import 'package:helmet_customer/views/splash_screen/splash_screen_binding.dart';

import 'package:helmet_customer/views/splash_screen/splash_screen.dart';
import 'package:helmet_customer/views/wallet/wallet.dart';
import 'package:helmet_customer/views/wallet/wallet_binding.dart';

class RouteClass {
  static List<GetPage> routs = [
    GetPage(
      name: RoutesString.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RoutesString.profile,
      page: () => SettingsScreen(),
      binding: ProfileScreenBinding(),
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
    GetPage(
      name: RoutesString.reservations,
      page: () => const ReservationScreen(),
      binding: ReservationBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RoutesString.packages,
      page: () => const PackagesPage(),
      binding: PackagesBinding(),
      transition: Transition.fadeIn,
    ),
     GetPage(
      name: RoutesString.wallet,
      page: () =>  WalletPage(),
      binding: WalletBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RoutesString.edit,
      page: () => EditPage(),
      binding: EditBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RoutesString.settings,
      page: () => SettingScreen(),
      binding: SettingBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RoutesString.feedback,
      page: () => FeedbackScreen(),
      binding: FeedbackBinding(),
      transition: Transition.fadeIn,
    ),
     GetPage(
      name: RoutesString.fawater,
      page: () => Fawater(),
      binding: FawaterBinding(),
      transition: Transition.fadeIn,
    ),
     GetPage(
      name: RoutesString.helps,
      page: () => HelpPage(),
      binding: HelpsBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
