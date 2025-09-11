import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/views/home/home_screen/widget/silver_app_bar/carusel_ads_home.dart';
import 'package:helmet_customer/views/home/home_screen/widget/silver_app_bar/top_header_home.dart';

class SilverAppBar extends StatelessWidget {
  final List adsCarusel;
  const SilverAppBar({super.key, required this.adsCarusel});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: true,
      backgroundColor: const Color.fromARGB(255, 57, 178, 226),
      expandedHeight: AppSize.height * 0.3,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            if (adsCarusel.isNotEmpty)
              CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlay: true,
                  // enlargeCenterPage: false,
                  viewportFraction: 1,
                  height: AppSize.height * 0.3,
                  enableInfiniteScroll: true,
                ),
                itemCount: adsCarusel.length,
                itemBuilder: (context, index, pageIndex) {
                  return CaruselAdsHome(
                    adsData: adsCarusel[index],
                  );
                },
              ),
            const Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: TopHeaderHome(),
            ),
          ],
        ),
      ),
    );
  }
}
