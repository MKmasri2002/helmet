import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/utils/global/global.dart';
import 'package:helmet_customer/utils/widgets/custom_nav_bar.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/views/home/home_screen/widget/buttom_slider.dart';
import 'package:helmet_customer/views/home/home_screen/widget/buttom_with_status.dart';
import 'package:helmet_customer/views/home/home_screen/widget/silver_app_bar/silver_app_bar.dart';
import 'package:helmet_customer/views/home/home_screen/widget/silver/silvers.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SilverAppBar(adsCarusel: packages.where((test)=> test.showInAdds == true).toList(),),
                const SliverToBoxAdapter(
                  child: Silvers(),
                ),
              ],
            ),
          ),

         
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (nearestOrder != null) ...[
                if (nearestOrder!.status == 'pending') const ButtomSlider(),
                if (nearestOrder!.status != 'pending')
                  const ButtomWithStatus(),
              ],
        const CustomNavBar(pos: 1),
            ],
          ),
        );
      },
    );
  }
}
