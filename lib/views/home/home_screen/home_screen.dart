import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/utils/widgets/custom_nav_bar.dart';
import 'package:helmet_customer/views/home/home_screen/widget/silver_app_bar/silver_app_bar.dart';
import 'package:helmet_customer/views/home/home_screen/widget/silver/silvers.dart';
import '../home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return Scaffold(
          backgroundColor: const Color(0xff0A6082),
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SilverAppBar(adsCarusel: ctrl.adsCaruselPackages),
                const SliverToBoxAdapter(
                  child: Silvers(),
                ),
              ],
            ),
          ),
          bottomNavigationBar: const CustomNavBar(pos: 1),
        );
      },
    );
  }
}
