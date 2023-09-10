import 'dart:io';

import 'package:cylinders/core/shared/strings/app_colors.dart';
import 'package:cylinders/core/shared/widgets/default_button.dart';
import 'package:cylinders/core/shared/widgets/default_text_form_field.dart';
import 'package:cylinders/extensions/app_extentions.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

import '../../../../core/shared/strings/app_assets.dart';

class AddBearingScreen extends StatefulWidget {
  static const String routeName = 'add-bearing';
  AddBearingScreen({super.key});

  @override
  State<AddBearingScreen> createState() => _AddBearingScreenState();
}

class _AddBearingScreenState extends State<AddBearingScreen> {
  bool darkTheme = true;

  var photoController = PhotoViewController();

  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.greyColor,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Text(
                      'Add bearing informations and specs',
                    ),
                  ),
                ),
                SizedBox(height: context.height * 0.05),
                // InkWell(
                //   onTap: () {},
                //   child: CircleAvatar(
                //     radius: 100,
                //     child: Icon(
                //       Icons.upload,
                //       size: 60,
                //     ),
                //   ),
                // ),
                if (file == null)
                  InkWell(
                    //todo handle the doublecated function
                    onTap: () async {
                      var picker = ImagePicker();
                      var image = await picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      if (image != null) {
                        setState(() {
                          file = File(image.path);
                        });
                        // print(image!.path);
                      }
                    },
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset(AppAssets.uploadIconImage),
                    ),
                  ),
                if (file != null)
                  InkWell(
                    onTap: () async {
                      var picker = ImagePicker();
                      var image = await picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      if (image != null) {
                        setState(() {
                          file = File(image.path);
                        });
                        // print(image!.path);
                      }
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: context.height * 0.3,
                      child: PhotoView(
                        controller: photoController,
                        enableRotation: true,
                        backgroundDecoration:
                            const BoxDecoration(color: AppColors.whiteColor),
                        imageProvider: FileImage(file!),
                      ),
                    ),
                  ),
                SizedBox(height: context.height * 0.05),
                DefaultTextFormField(
                  label: 'Bearing name',
                  darkTheme: darkTheme,
                ),
                SizedBox(height: context.height * 0.05),
                DefaultTextFormField(
                  label: 'Bearing Type',
                  darkTheme: darkTheme,
                ),
                SizedBox(height: context.height * 0.05),
                DefaultTextFormField(
                  label: 'Is Radial',
                  darkTheme: darkTheme,
                ),
                SizedBox(height: context.height * 0.05),
                DefaultTextFormField(
                  label: 'Usage',
                  darkTheme: darkTheme,
                ),
                SizedBox(height: context.height * 0.05),
                DefaultTextFormField(
                  label: 'Start Clearance',
                  darkTheme: darkTheme,
                  inputType: const TextInputType.numberWithOptions(),
                ),
                SizedBox(height: context.height * 0.05),
                DefaultTextFormField(
                  label: 'End Clearance',
                  darkTheme: darkTheme,
                  inputType: const TextInputType.numberWithOptions(),
                ),
                SizedBox(height: context.height * 0.05),
                DefaultButton(
                  label: 'Save and submit',
                  onPressed: () {},
                  backColor: AppColors.lightGreenColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
