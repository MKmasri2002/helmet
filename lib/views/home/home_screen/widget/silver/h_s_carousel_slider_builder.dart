import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/views/home/home_screen/widget/silver/current_package_widget.dart';


class HomeScreenCarouselSliderBuilder extends StatelessWidget {
  final List userWashDataTripModel;
  const HomeScreenCarouselSliderBuilder({super.key, required this.userWashDataTripModel});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: false,
        viewportFraction: 1,
        height: AppSize.height * 0.24,
        initialPage: 0,
        enableInfiniteScroll: false,
        scrollDirection: Axis.horizontal,
      ),
      itemCount: userWashDataTripModel.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        if (userWashDataTripModel[itemIndex].washCount == 0) {
          return const SizedBox.shrink();
        }
        return CurrentPackageWidget(
          currentWasghDataTripModel: userWashDataTripModel[itemIndex],
        );
      },
    );
  }
}
