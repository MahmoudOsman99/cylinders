import 'package:cylinders/core/shared/strings/app_colors.dart';
import 'package:cylinders/extensions/app_extentions.dart';
import 'package:cylinders/features/bearing_types/domain/entities/bearing_entity.dart';
import 'package:cylinders/features/bearing_types/presentation/screens/add_bearing_screen.dart';
import 'package:cylinders/features/bearing_types/presentation/screens/bearing_type_details_screen.dart';

import 'package:flutter/material.dart';

import '../widgets/bearing-types.dart';

class BearingTypeScreen extends StatelessWidget {
  static const String routeName = 'bearingTypes';

  const BearingTypeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.orangeColor,
        onPressed: () {
          Navigator.pushNamed(context, AddBearingScreen.routeName);
        },
        child: const Icon(
          Icons.add,
          color: AppColors.blackTextColor,
          size: 30,
        ),
      ),
      backgroundColor: AppColors.blackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Text('Bearing types'),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  return BearingItem(
                    imageIndex: index,
                    bearing: BearingType.bearings[index],
                  );
                },
                itemCount: BearingType.imageList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BearingItem extends StatelessWidget {
  BearingItem({super.key, required this.imageIndex, required this.bearing});
  final Bearing bearing;
  int imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          BearingTypeDetailsScreen.routeName,
          arguments: bearing,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.lightGreenColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        'اعرف اكتر عنها',
                        style: context.textList.bodyMedium!.copyWith(
                          color: AppColors.blackTextColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  width: context.width / 2,
                  height: context.height * 0.25,
                  child: Image.asset(
                    bearing.image!,
                    // AppAssets.thrustImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
