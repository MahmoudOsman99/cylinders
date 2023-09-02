import 'package:cylinders/core/shared/strings/app_assets.dart';
import 'package:cylinders/extensions/app_extentions.dart';
import 'package:cylinders/features/gap_feature/presentation/screens/get_gap_screen.dart';
import 'package:flutter/material.dart';

import 'config/routes/routes.dart';
import 'core/shared/strings/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: context.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.gapAndSpringRoute);
                  },
                  child: SizedBox(
                    width: 150,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              AppAssets.gapImage,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: context.height * 0.01,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.blackTextColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'عايز الجاب',
                                style: context.textList.bodyMedium!.copyWith(
                                  color: AppColors.blackTextColor,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.screwAndMRoute);
                  },
                  child: SizedBox(
                    width: 150,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                AppAssets.screwImage,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: context.height * 0.01,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color:
                                    AppColors.blackTextColor.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'مسمار و مقاسات',
                                  style: context.textList.bodyMedium!.copyWith(
                                    color: AppColors.blackTextColor,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.questionRoute);
                  },
                  child: SizedBox(
                    width: 150,
                    // height: 190,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                AppAssets.technicianIconImage,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: context.height * 0.01,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color:
                                    AppColors.blackTextColor.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'مشاكل و اعطال',
                                  style: context.textList.bodyMedium!.copyWith(
                                    color: AppColors.blackTextColor,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.pushNamed(context, Routes.screwAndMRoute);
                  },
                  child: SizedBox(
                    width: 150,
                    // height: 190,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                AppAssets.questionIconImage,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: context.height * 0.01,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color:
                                    AppColors.blackTextColor.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'اسئلة و معلومات',
                                  style: context.textList.bodyMedium!.copyWith(
                                    color: AppColors.blackTextColor,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: context.width,
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}
