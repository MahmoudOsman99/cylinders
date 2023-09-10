import 'package:cylinders/core/shared/strings/app_colors.dart';
import 'package:cylinders/core/shared/widgets/default_app_bar.dart';
import 'package:cylinders/core/shared/widgets/default_button.dart';
import 'package:cylinders/core/shared/widgets/top_image_and_name.dart';
import 'package:cylinders/extensions/app_extentions.dart';
import 'package:cylinders/features/bearing_types/domain/entities/bearing_entity.dart';
import 'package:cylinders/features/bearing_types/presentation/screens/add_bearing_screen.dart';
import 'package:cylinders/features/bearing_types/presentation/screens/bearing_type_details_screen.dart';

import 'package:flutter/material.dart';

import '../widgets/bearing-types.dart';
import '../widgets/bearing_item.dart';

class BearingTypeScreen extends StatelessWidget {
  static const String routeName = 'bearingTypes';

  const BearingTypeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: defaultAppBar(
      //   title: Text('data'),
      // ),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const TopImageAndName(),
              SizedBox(
                height: context.height * 0.07,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: AppColors.greyColor,
                      ),
                    );
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
      ),
    );
  }
}
