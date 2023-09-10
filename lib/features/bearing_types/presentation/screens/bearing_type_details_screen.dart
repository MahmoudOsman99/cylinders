import 'dart:ffi';

import 'package:cylinders/extensions/app_extentions.dart';
import 'package:cylinders/features/bearing_types/domain/entities/bearing_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/strings/app_assets.dart';
import '../../../../core/shared/strings/app_colors.dart';

class BearingTypeDetailsScreen extends StatelessWidget {
  static const String routeName = 'bearing-type-details';
  Bearing bearing;
  BearingTypeDetailsScreen({
    super.key,
    required this.bearing,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackTextColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                bearing.image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: SizedBox(
                          width: context.width * 0.7,
                          height: context.height * 0.3,
                          child: Image.asset(
                            bearing.image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : const SizedBox(),
                SizedBox(
                  height: context.height * 0.02,
                ),
                BearingSpecsItemWidget(
                  lable: 'أسم البلية',
                  value: bearing.name,
                ),
                BearingSpecsItemWidget(
                  lable: 'النوع',
                  value: BearingTypes.values[bearing.type].name,
                ),
                BearingSpecsItemWidget(
                  lable: 'الأستخدامات',
                  value: bearing.usage,
                ),
                BearingSpecsItemWidget(
                  lable: 'بداية الخلوص',
                  value: '${bearing.startClearance.toStringAsFixed(2)} mm',
                ),
                BearingSpecsItemWidget(
                  lable: 'نهاية الخلوص',
                  value: 'mm ${bearing.endClearance.toStringAsFixed(2)}',
                ),
                BearingSpecsItemWidget(
                  lable: 'مثال لأول رقم',
                  value: bearing.numCat,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BearingSpecsItemWidget extends StatelessWidget {
  const BearingSpecsItemWidget({
    super.key,
    // required this.bearing,
    required this.lable,
    required this.value,
  });
  final String lable;
  final String value;

  // final Bearing bearing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.greyColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: context.width,
                // height: context.height * 0.01,
              ), // todo to make the row get the all width
              DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.lightOrangeColor,
                  // gradient: AppColors.gradientPurple,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 3,
                  ),
                  child: Text(
                    lable,
                    style: context.textList.bodyMedium!.copyWith(
                      color: AppColors.blackTextColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              Text(
                value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
