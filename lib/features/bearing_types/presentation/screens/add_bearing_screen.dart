import 'dart:io';

import 'package:cylinders/core/shared/strings/app_colors.dart';
import 'package:cylinders/core/shared/widgets/default_button.dart';
import 'package:cylinders/core/shared/widgets/default_text_form_field.dart';
import 'package:cylinders/extensions/app_extentions.dart';
import 'package:cylinders/features/bearing_types/domain/entities/bearing_entity.dart';
import 'package:cylinders/features/bearing_types/presentation/cubit/bearing_types_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController isRadialController = TextEditingController();
  TextEditingController usageController = TextEditingController();
  TextEditingController startClearanceController = TextEditingController();
  TextEditingController endClearanceController = TextEditingController();
  BearingTypes _selectedType = BearingTypes.Cylindrical;
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    typeController.dispose();
    isRadialController.dispose();
    usageController.dispose();
    startClearanceController.dispose();
    endClearanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BearingTypesCubit, BearingTypesState>(
      listener: (context, state) {},
      builder: (context, state) {
        var bCubit = BearingTypesCubit.get(context);

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
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: PhotoView(
                              controller: photoController,
                              enableRotation: true,
                              backgroundDecoration: const BoxDecoration(
                                  color: Colors.transparent),
                              imageProvider: FileImage(file!),
                              // imageProvider: FileImage(file!),
                            ),
                          ),
                        ),
                      ),
                    // SizedBox(height: context.height * 0.05),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          DefaultTextFormField(
                            controller: nameController,
                            label: 'أسم البلية',
                            darkTheme: darkTheme,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'الحقل مطلوب';
                              }
                              return null;
                            },
                          ),

                          // SizedBox(height: context.height * 0.05),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: SizedBox(
                              width: double.infinity,
                              height: context.height * 0.07,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: AppColors.greyColor,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: AppColors.lightOrangeColor,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: DropdownButton<BearingTypes>(
                                    underline: const SizedBox(),
                                    dropdownColor: AppColors.greyColor,
                                    iconEnabledColor: AppColors.whiteColor,
                                    menuMaxHeight: 250,
                                    borderRadius: BorderRadius.circular(15),
                                    style:
                                        context.textList.bodyMedium!.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                                    value: _selectedType,
                                    items: BearingTypes.values.map(
                                      (type) {
                                        return DropdownMenuItem<BearingTypes>(
                                          value: type,
                                          child: Text(
                                              type.toString().split('.').last),
                                        );
                                      },
                                    ).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedType = value!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // DefaultTextFormField(
                          //   controller: typeController,
                          //   label: 'Bearing Type',
                          //   darkTheme: darkTheme,
                          // ),
                          // SizedBox(height: context.height * 0.05),
                          DefaultTextFormField(
                            label: 'يتحمل احمال عمودية؟',
                            darkTheme: darkTheme,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'الحقل مطلوب';
                              }
                              return null;
                            },
                          ),

                          // Radio(
                          //   value: true,
                          //   groupValue: true,
                          //   toggleable: true,
                          //   onChanged: (value) {},
                          // ),
                          // SizedBox(
                          //   child: DecoratedBox(
                          //     decoration: BoxDecoration(
                          //       color: Colors.white,
                          //     ),
                          //     child: Checkbox(
                          //       value: true,
                          //       onChanged: (value) {},
                          //       semanticLabel: 'Is Radial',
                          //       checkColor: AppColors.orangeColor,
                          //       activeColor: AppColors.greyColor,
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(height: context.height * 0.05),
                          DefaultTextFormField(
                            label: 'الاستخدامات',
                            darkTheme: darkTheme,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'الحقل مطلوب';
                              }
                              return null;
                            },
                          ),
                          // SizedBox(height: context.height * 0.05),
                          DefaultTextFormField(
                            label: 'بداية الخلوص',
                            darkTheme: darkTheme,
                            inputType: const TextInputType.numberWithOptions(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'الحقل مطلوب';
                              } else if (double.tryParse(value)! >= 0) {}
                              return null;
                            },
                          ),
                          // SizedBox(height: context.height * 0.05),
                          DefaultTextFormField(
                            controller: endClearanceController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'الحقل مطلوب';
                              } else if (double.tryParse(value)! >= 0) {}
                              return null;
                            },
                            label: 'نهاية الخلوص',
                            darkTheme: darkTheme,
                            inputType: const TextInputType.numberWithOptions(),
                          ),
                          DefaultTextFormField(
                            controller: endClearanceController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'الحقل مطلوب';
                              } else if (double.tryParse(value)! >= 0) {}
                              return null;
                            },
                            label: 'مثال لأرقام اللبية',
                            darkTheme: darkTheme,
                            inputType: const TextInputType.numberWithOptions(),
                          ),
                          // SizedBox(height: context.height * 0.05),
                          DefaultButton(
                            label: 'Save and submit',
                            width: context.width,
                            paddingValue: 15,
                            onPressed: () {
                              // if (formKey.currentState == null) return;
                              // if (formKey.currentState!.validate()) {
                              //   print('validate');
                              bCubit.addBearing(
                                Bearing(
                                  name:
                                      'Angular Contact ball bearing single row',
                                  type: BearingTypes.Cylindrical.index,
                                  usage:
                                      'بتشيل احمال الاكسيال اول المحوية او احمال التراحيل بنسبة كبيره و بتستخدم اكتير بديل للثراست في السرعات العالية',
                                  startClearance: 0.1,
                                  endClearance: 0.10,
                                  numCat: 'Like 7024',
                                  isRadial: true,
                                ),
                              );
                              // }
                            },
                            gradient: AppColors.gradientPurple,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

enum LoadDirections {
  Axial,
  Radial,
  AxialAndRadial,
}
