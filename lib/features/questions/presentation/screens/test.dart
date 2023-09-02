import 'package:carousel_slider/carousel_slider.dart';
import 'package:cylinders/extensions/app_extentions.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/strings/app_assets.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height * 0.2,
      child: CarouselSlider(
        items: [
          //       // SizedBox(
          //       //   height: 100,
          //       //   width: 100,
          //       //   child: Image.asset(
          //       //     'assets/images/troubleshoots/smoke.jpg',
          //       //   ),
          //       // ),
          Image.asset(
            AppAssets.couplingImage,
            fit: BoxFit.cover,
          ),
          Image.asset(
            AppAssets.lebranceImage,
            fit: BoxFit.cover,
          ),
          Image.asset(
            AppAssets.finishBackCoverImage,
            fit: BoxFit.cover,
          ),
          Image.asset(
            AppAssets.rougherImage,
            fit: BoxFit.cover,
          ),
        ],
        options: CarouselOptions(
          height: 400,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (index, reason) {},
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
