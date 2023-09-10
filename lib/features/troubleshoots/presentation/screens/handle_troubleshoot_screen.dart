import 'dart:io';

import 'package:cylinders/core/shared/strings/app_assets.dart';
import 'package:cylinders/core/shared/widgets/default_button.dart';
import 'package:cylinders/core/shared/widgets/top_image_and_name.dart';
import 'package:cylinders/extensions/app_extentions.dart';
import 'package:cylinders/features/troubleshoots/presentation/cubit/troubleshoots_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

import '../../../../core/shared/strings/app_colors.dart';
import '../../../../core/shared/widgets/default_text_form_field.dart';
import '../../domain/entities/troubleshoot.dart';

class HandleTroubleshootScreen extends StatefulWidget {
  const HandleTroubleshootScreen({super.key});
  static const String routeName = 'handle-troubleshoot';

  @override
  State<HandleTroubleshootScreen> createState() =>
      _HandleTroubleshootScreenState();
}

class _HandleTroubleshootScreenState extends State<HandleTroubleshootScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController problemNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController solveingController = TextEditingController();
  var photoController = PhotoViewController();
  File? file;

  @override
  void dispose() {
    problemNameController.dispose();
    descriptionController.dispose();
    solveingController.dispose();
    photoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TroubleshootsCubit, TroubleshootsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var tCubit = TroubleshootsCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.blackgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        TopImageAndName(),
                        // SizedBox(
                        //   height: 60,
                        //   width: double.infinity,
                        //   child: DecoratedBox(
                        //     decoration: BoxDecoration(
                        //       // color: AppColors.lightOrangeColor,
                        //       gradient: AppColors.gradientPurple,
                        //       borderRadius: BorderRadius.circular(15),
                        //     ),
                        //     child: Center(
                        //       child: Text(
                        //         'اكتب المشكله و الحل',
                        //         style: context.textList.bodyMedium!.copyWith(
                        //             // color: AppColors.blackTextColor,
                        //             ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        if (file == null)
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
                              width: 150,
                              height: 150,
                              child: Image.asset(AppAssets.uploadIconImage),
                            ),
                          ),
                        if (file != null)
                          SizedBox(
                            width: double.infinity,
                            height: context.height * 0.3,
                            child: PhotoView(
                              controller: photoController,
                              enableRotation: true,
                              backgroundDecoration: const BoxDecoration(
                                color: AppColors.whiteColor,
                              ),
                              imageProvider: FileImage(file!),
                            ),
                          ),
                        SizedBox(
                          height: 30,
                        ),
                        DefaultTextFormField(
                          controller: problemNameController,
                          label: 'المشكلة',
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'اكتب اسم المشكلة';
                            } else {
                              return null;
                            }
                          },
                          darkTheme: true,
                        ),
                        SizedBox(
                          height: context.height * 0.03,
                        ),
                        DefaultTextFormField(
                          controller: descriptionController,
                          label: 'وصف المشكلة',
                          darkTheme: true,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'اكتب وصف المشكلة';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: context.height * 0.03,
                        ),
                        DefaultTextFormField(
                          controller: solveingController,
                          minLines: 3,
                          maxLines: 6,
                          label: 'الحل',
                          inputType: TextInputType.multiline,
                          darkTheme: true,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              // showSnackBar(
                              //   snackText: 'اكتب حل المشكلة',
                              //   context: context,
                              // );
                              return 'اكتب حل المشكلة';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: context.height * 0.05,
                        ),
                        DefaultButton(
                          label: 'حفظ المشكلة و الحل',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              tCubit.addTroubleshoot(
                                Troubleshoot(
                                  name: problemNameController.text,
                                  descrition: descriptionController.text,
                                  solve: solveingController.text,
                                ),
                              );
                              Navigator.pop(context);
                            }
                          },
                          width: context.width / 2,
                          gradient: AppColors.gradientPurple,
                          paddingValue: 15,
                        ),
                        // InkWell(
                        //   onTap: () {
                        //     if (formKey.currentState!.validate()) {
                        //       tCubit.addTroubleshoot(
                        //         Troubleshoot(
                        //           name: problemNameController.text,
                        //           descrition: descriptionController.text,
                        //           solve: solveingController.text,
                        //         ),
                        //       );
                        //       Navigator.pop(context);
                        //     }
                        //   },
                        //   child: SizedBox(
                        //     height: 50,
                        //     width: context.width / 2,
                        //     child: DecoratedBox(
                        //       decoration: BoxDecoration(
                        //         color: AppColors.lightGreenColor,
                        //         borderRadius: BorderRadius.circular(15),
                        //       ),
                        //       child: const Center(
                        //         child: Text('تسسجل المشكلة و الحل'),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
