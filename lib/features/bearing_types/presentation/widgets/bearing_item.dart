import 'package:cylinders/extensions/app_extentions.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/strings/app_colors.dart';
import '../../../../core/shared/widgets/default_button.dart';
import '../../domain/entities/bearing_entity.dart';
import '../screens/bearing_type_details_screen.dart';

class BearingItem extends StatelessWidget {
  BearingItem({super.key, required this.imageIndex, required this.bearing});
  final Bearing bearing;
  int imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          // color: AppColors.lightOrangeColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: context.width * 0.25,
                  child: Text(
                    bearing.name,
                    maxLines: 3,
                  ),
                ),
                SizedBox(
                  height: context.height * 0.1,
                ),
                SizedBox(
                  width: context.width / 3,
                  child: DefaultButton(
                    label: 'أعرف اكتر عنها',
                    width: context.width / 3,
                    paddingValue: 10,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        BearingTypeDetailsScreen.routeName,
                        arguments: bearing,
                      );
                    },
                    // backColor: AppColors.lightGreenColor,
                    gradient: AppColors.gradientPurple,
                  ),
                ),
                // DecoratedBox(
                //   decoration: BoxDecoration(
                //     color: AppColors.lightGreenColor,
                //     borderRadius: BorderRadius.circular(5),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 10, vertical: 5),
                //     child: Text(
                //       'اعرف اكتر عنها',
                //       style: context.textList.bodyMedium!.copyWith(
                //         color: AppColors.blackTextColor,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                width: context.width / 2,
                height: context.height * 0.25,
                child: Image.asset(
                  bearing.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
