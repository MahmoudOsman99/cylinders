import 'dart:convert';

import 'package:cylinders/core/shared/strings/app_assets.dart';
import 'package:cylinders/core/shared/strings/app_colors.dart';
import 'package:cylinders/core/shared/widgets/default_button.dart';
import 'package:cylinders/core/shared/widgets/top_image_and_name.dart';
import 'package:cylinders/extensions/app_extentions.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GetGapScreen extends StatefulWidget {
  const GetGapScreen({super.key});

  @override
  State<GetGapScreen> createState() => _GetGapScreenState();
}

class _GetGapScreenState extends State<GetGapScreen> {
  // List<bool> selections = List.generate(2, (index) => false);

  final formKey = GlobalKey<FormState>();
  int selectedOption = 1;
  double gapVlaue = 0;
  int springCount = 48;
  TextEditingController radiusController = TextEditingController();
  bool isFlat = false;
  int standardRadius = 275;
  int staticFactor = 244;
  int minusNum = 33;
  double minus = 0;
  double radiusCylinder = 0;

  @override
  void dispose() {
    radiusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackTextColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: context.height * 0.45,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      TopImageAndName(),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isFlat = false;
                              });
                            },
                            child: SizedBox(
                              width: 120,
                              height: 75,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: isFlat
                                      ? AppColors.whiteColor
                                      : AppColors.lightPurpleColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    'مشرشر',
                                    style:
                                        context.textList.bodyMedium!.copyWith(
                                      color: isFlat
                                          ? AppColors.blackTextColor
                                          : AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isFlat = true;
                              });
                            },
                            child: SizedBox(
                              width: 120,
                              height: 75,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: isFlat
                                      ? AppColors.lightPurpleColor
                                      : AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    'فلات',
                                    style:
                                        context.textList.bodyMedium!.copyWith(
                                      color: isFlat
                                          ? AppColors.whiteColor
                                          : AppColors.blackTextColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      const Text('اكتب قطر السلندر'),
                      SizedBox(
                        height: 10,
                      ),
                      Form(
                        key: formKey,
                        child: SizedBox(
                          width: context.width / 2,
                          height: 50,
                          child: TextFormField(
                            controller: radiusController,
                            style: context.textList.bodyMedium!.copyWith(
                              color: AppColors.blackTextColor,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'اكتب قطر صحيح',
                                      textAlign: TextAlign.center,
                                    ),
                                    backgroundColor: AppColors.lightRedColor,
                                  ),
                                );
                                return 'اكتب قطر صحيح';
                              } else if (double.tryParse(value)! > 275) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'القطر اكبر من الاستاندرد',
                                      textAlign: TextAlign.center,
                                    ),
                                    backgroundColor: AppColors.lightRedColor,
                                  ),
                                );
                              } else if (double.tryParse(value)! < 244) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'القطر اصغر من المسموح بيه 244',
                                      textAlign: TextAlign.center,
                                    ),
                                    backgroundColor: AppColors.lightRedColor,
                                  ),
                                );
                              }
                            },
                            textAlign: TextAlign.center,
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      DefaultButton(
                        label: 'احسب الجاب',
                        gradient: AppColors.gradientPurple,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            radiusCylinder =
                                double.tryParse(radiusController.text)!;
                            if (radiusCylinder > 275 || radiusCylinder < 244) {
                              return;
                            }
                            setState(() {
                              minus = standardRadius - radiusCylinder;
                              gapVlaue = minusNum - minus;
                              if (isFlat) {
                                gapVlaue += 6;
                              }
                            });

                            if (radiusCylinder <= 275 &&
                                radiusCylinder >= 268) {
                              springCount = 48;
                            } else if (radiusCylinder < 268 &&
                                radiusCylinder >= 260) {
                              springCount = 46;
                            } else if (radiusCylinder < 260 &&
                                radiusCylinder >= 255) {
                              springCount = 44;
                            } else if (radiusCylinder < 255 &&
                                radiusCylinder >= 250) {
                              springCount = 42;
                            } else {
                              springCount = 40;
                            }
                            if (isFlat && springCount != 48) {
                              springCount += 2;
                            }
                          }
                        },
                        width: context.width / 2,
                        paddingValue: 15,
                      ),
                      // InkWell(
                      //   onTap: ,
                      //   child: SizedBox(
                      //     height: 50,
                      //     width: context.width / 2,
                      //     child: DecoratedBox(
                      //       decoration: BoxDecoration(
                      //         color: AppColors.lightGreenColor,
                      //         borderRadius: BorderRadius.circular(15),
                      //       ),
                      //       child: const Center(
                      //         child: Text('احسب الجاب'),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: context.height * 0.7,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.greyColor,
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(40),
                      topEnd: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      if (gapVlaue > 0)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'القطر الاستاندرد:     275',
                                  style: context.textList.bodyMedium!.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),

                                Text(
                                  'قطر السلندر المراد:     ${double.tryParse(radiusController.text)}',
                                  style: context.textList.bodyMedium!.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                Text(
                                  'ناتج الطرح:     ${minus.toStringAsFixed(1)}',
                                  style: context.textList.bodyMedium!.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                Text(
                                  'الرقم اللي بنطرح منه الناتج:  $minusNum',
                                  style: context.textList.bodyMedium!.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                Text(
                                  'الجاب:     ${gapVlaue.toStringAsFixed(1)}',
                                  style: context.textList.bodyMedium!.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                // if (isFlat)
                                //   Text(
                                //     'الجاب:     ${gapVlaue.toStringAsFixed(1)}',
                                //     style:
                                //         context.textList.bodyMedium!.copyWith(
                                //       color: AppColors.blackTextColor,
                                //     ),
                                //   ),
                                // if (isFlat)
                                Text(
                                  ' لو فلات بنزود:     6mm',
                                  style: context.textList.bodyMedium!.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                SizedBox(
                                  width: context.width / 2,
                                  child: Text(
                                    'مع اعتبار احتمالية خطأ او نسبة تفاوت من 1 الي 2 مم',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        context.textList.bodyMedium!.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                                // SizedBox(
                                //   height: 20,
                                // ),
                              ],
                            ),
                            CircularPercentIndicator(
                              radius: 50.0,
                              lineWidth: 10.0,
                              animation: true,
                              percent: gapVlaue / 100,
                              center: Text(
                                "${gapVlaue.toStringAsFixed(1)} mm",
                                style: context.textList.displayMedium!.copyWith(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              footer: Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(top: 10),
                                child: Text(
                                  "قيمة الجاب من 33",
                                  style:
                                      context.textList.displayMedium!.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: AppColors.lightPurpleColor,
                            ),
                          ],
                        ),
                      if (gapVlaue > 0)
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(),
                        ),
                      SizedBox(
                        height: context.height * 0.03,
                      ),
                      if (gapVlaue > 0)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'قطر من 275 : 268 يبقي: 48 وردة',
                                  style: context.textList.bodyMedium!.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                Text(
                                  'قطر من 268 : 260 يبقي: 46 وردة',
                                  style: context.textList.bodyMedium!.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                Text(
                                  'قطر من 260 : 255 يبقي: 44 وردة',
                                  style: context.textList.bodyMedium!.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                Text(
                                  'قطر من 255 : 250 يبقي:  42 وردة',
                                  style: context.textList.bodyMedium!.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                Text(
                                  'قطر اقل من 250 يبقي:    40 وردة',
                                  style: context.textList.bodyMedium!.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                SizedBox(
                                  width: context.width / 2,
                                  child: Text(
                                    ' لو فلات بنزود:      2 وردة سبرينج عشان فرق الجاب',
                                    style:
                                        context.textList.bodyMedium!.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                                if (isFlat && radiusCylinder >= 270)
                                  SizedBox(
                                    width: context.width / 2,
                                    child: Text(
                                      ' و قطر الفلات اكبر من 275 يبقي تخلي التكايات 48 و تحط ورده خارجيه تحت التكاية عشان متعملش قفزه عشان بيتم فتح الجاب اكتر من 7 مم في بعض الاحيان ع حسب الانتاج',
                                      // maxLines: 6,
                                      // overflow: TextOverflow.ellipsis,
                                      style:
                                          context.textList.bodyMedium!.copyWith(
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ),
                                // RichText(
                                //   text: TextSpan(
                                //     children: [
                                //       TextSpan(text: 'fsssssssssssefw')
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                            CircularPercentIndicator(
                              radius: 50.0,
                              lineWidth: 10.0,
                              animation: true,
                              percent: gapVlaue / 100,
                              center: Text(
                                "spring $springCount",
                                style: context.textList.displayMedium!.copyWith(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              footer: Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(top: 10),
                                child: Text(
                                  "عدد ورد Spring\n من 48",
                                  style:
                                      context.textList.displayMedium!.copyWith(
                                    height: 1.5,
                                    color: AppColors.whiteColor,
                                  ),
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: AppColors.lightPurpleColor,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   width: context.width * 0.8,
              //   child: Text(
              //     // '~ ${resultM.toStringAsFixed(1)}',
              //     'كل النتائج اللي موجود في البرنامج ده عباره عن اجتهاد شخصي مني و معرضه للخطأ و اذا وجد خطأ ارجوا المعذره و ابلاغي 01000249042 و سوف يتم التصحيح و ذكر اسم المصحح ',
              //     maxLines: 4,
              //     overflow: TextOverflow.ellipsis,
              //     textAlign: TextAlign.center,
              //     style: context.textList.bodyMedium!.copyWith(
              //       color: AppColors.blackTextColor.withOpacity(.4),
              //       fontSize: 15,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
     ListTile(
                    title: const Text('مشرشر او مطلوب جاب ١ مم'),
                    leading: Radio<int>(
                      value: 1,
                      groupValue: selectedOption,
                      activeColor: Colors
                          .red, // Change the active radio button color here
                      fillColor: MaterialStateProperty.all(
                        Colors.red,
                      ), // Change the fill color when selected
                      splashRadius: 20, // Change the splash radius when clicked
                      onChanged: (int? value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('فلات ( جاب اعلي من ١ مم )'),
                    leading: Radio<int>(
                      value: 2,
                      groupValue: selectedOption,
                      activeColor: Colors
                          .blue, // Change the active radio button color here
                      fillColor: MaterialStateProperty.all(
                        Colors.blue,
                      ), // Change the fill color when selected
                      splashRadius: 50, // Change the splash radius when clicked
                      onChanged: (int? value) {
                        setState(
                          () {
                            selectedOption = value!;
                          },
                        );
                      },
                    ),
                  ),



                     CircularPercentIndicator(
                        radius: 50.0,
                        lineWidth: 13.0,
                        animation: true,
                        percent: 0.7,
                        center: const Text(
                          "70.0%",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                        footer: const Text(
                          "Sales this week",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.0),
                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: Colors.purple,
                      ),
 */
