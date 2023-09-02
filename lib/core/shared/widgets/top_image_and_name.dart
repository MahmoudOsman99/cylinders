import 'package:cylinders/extensions/app_extentions.dart';
import 'package:flutter/material.dart';

import '../strings/app_assets.dart';
import '../strings/app_colors.dart';

class TopImageAndName extends StatelessWidget {
  const TopImageAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(AppAssets.myImage),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  'أهلا بيك في قسم السلندرات',
                  style: context.textList.labelSmall,
                ),
                Text(
                  'Mahmoud Osman',
                  style: context.textList.bodyMedium,
                ),
              ],
            ),
          ],
        ),
        const Icon(
          Icons.notification_add,
          color: AppColors.whiteColor,
        ),
      ],
    );
  }
}
