import 'package:cylinders/extensions/app_extentions.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/strings/app_assets.dart';
import '../../../../core/shared/strings/app_colors.dart';
import '../../domain/entities/troubleshoot.dart';
import '../screens/troubleshoot_details_screen.dart';

class TroubleshootWidget extends StatelessWidget {
  final Troubleshoot troubleshoot;
  const TroubleshootWidget({
    super.key,
    required this.troubleshoot,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          TroubleshootDetailsScreen.routeName,
          arguments: troubleshoot,
        );
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
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
                          'Mahmoud Osman',
                          style: context.textList.bodyMedium!.copyWith(
                            color: AppColors.blackTextColor,
                          ),
                        ),
                        Text(
                          'Programmer',
                          style: context.textList.bodyMedium!.copyWith(
                            color: AppColors.blackTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      troubleshoot.name,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: context.textList.bodyMedium!.copyWith(
                        color: AppColors.blackTextColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: context.width / 2,
                  height: context.height * 0.2,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        AppAssets.lebranceImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
