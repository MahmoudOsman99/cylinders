import 'package:cylinders/core/shared/strings/app_assets.dart';
import 'package:cylinders/core/shared/strings/app_colors.dart';
import 'package:cylinders/extensions/app_extentions.dart';
import 'package:cylinders/features/questions/domain/entities/question.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class QuestionDetailsScreen extends StatelessWidget {
  final Question question;
  const QuestionDetailsScreen({
    super.key,
    required this.question,
  });

  static const routeName = '/question-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackTextColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              SizedBox(
                width: context.width,
                height: context.height * 0.2,
                child: CarouselSlider(
                  items: [
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
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (index, reason) {},
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              SizedBox(
                height: context.height * 0.1,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('المشكلة:\n'),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      question.name,
                    ),
                  ),
                  // Expanded(
                  //   child: Text(
                  //     'المكنة بتدخن اول التشغيل',
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: context.height * 0.05,
              ),
              Row(
                children: [
                  const Text('الحل:\n'),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      question.solve,
                    ),
                  ),
                  // Expanded(
                  //   child: Text(
                  //     'ايه اللي يخلي المكنة تدخن في بداية تشغيها و هي علي الخط؟',
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: context.height * 0.05,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('الشرح:'),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(question.descrition),
                  ),
                  // Expanded(
                  //   child: Text(
                  //     'المشكلة دي بتحصل لما يكون في مشكله في اللابرنس او الوش ممكن يكون في اي زيادات او اي رايش حتي لو غير ملحوظ ف بيسحن و بيسخن معاه اي شحم او اي حاجه تعمل الدخنه دي وقت التشغيل. \n و ممكن كمان يكون الدليل لازق او زانق جامد علي السلندر ف هيحمل احتكاك و بالتالي هيعمل سخونة\n او يكون شادد تراحيل و بالتالي تحصل برضو نقس المشكلة',
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
