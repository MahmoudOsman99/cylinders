import 'package:cylinders/core/shared/widgets/default_button.dart';
import 'package:cylinders/core/shared/widgets/show_snackbar.dart';
import 'package:cylinders/core/shared/widgets/top_image_and_name.dart';
import 'package:cylinders/extensions/app_extentions.dart';
import 'package:cylinders/features/screw_m/presentation/cubit/key_m_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/shared/strings/app_colors.dart';

class GetMOrScrew extends StatefulWidget {
  const GetMOrScrew({super.key});

  @override
  State<GetMOrScrew> createState() => _GetMOrScrewState();
}

class _GetMOrScrewState extends State<GetMOrScrew> {
  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  bool isM = false;

  //todo;
  double resultKey = 0;
  double resultM = 0;
  // double targetedValue = 0.0;
  double result = 0;
  bool showInvalidInputMessage = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<KeyAndMCubit, KeyAndMState>(
      listener: (context, state) {},
      builder: (context, state) {
        final keyCubit = KeyAndMCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.blackTextColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: context.height * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          const TopImageAndName(),
                          SizedBox(
                            height: context.height * 0.02,
                          ),
                          const Text('عايز مقاس ايه'),
                          SizedBox(
                            height: context.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (!isM) return;
                                    isM = false;
                                    resultM = 0;
                                    resultKey = 0;
                                    result = 0;

                                    textController.text = '';
                                  });
                                },
                                child: SizedBox(
                                  width: 120,
                                  height: 75,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: isM
                                          ? AppColors.whiteColor
                                          : AppColors.lightOrangeColor,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'مفتاح',
                                        style: context.textList.bodyMedium!
                                            .copyWith(
                                          color: AppColors.blackTextColor,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (isM) return;
                                    isM = true;
                                    resultM = 0;
                                    resultKey = 0;
                                    result = 0;
                                    textController.text = '';
                                  });
                                },
                                child: SizedBox(
                                  width: 120,
                                  height: 75,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: isM
                                          ? AppColors.lightOrangeColor
                                          : AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'M',
                                        style: context.textList.bodyMedium!
                                            .copyWith(
                                          color: AppColors.blackTextColor,
                                          fontSize: 26,
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
                          Text(
                            isM ? 'اكتب مقاس المفتاح' : 'اكتب مقياس ال  M',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Form(
                            key: formKey,
                            child: SizedBox(
                              width: context.width / 2,
                              height: 50,
                              child: TextFormField(
                                controller: textController,
                                style: context.textList.bodyMedium!.copyWith(
                                  color: AppColors.blackTextColor,
                                ),
                                textInputAction: TextInputAction.done,
                                onFieldSubmitted: (value) {
                                  // if (validations())
                                  calculateResults();
                                  // setState(() {
                                  //   result = keyCubit.calculateResult(
                                  //     isM: isM,
                                  //     targetedValue: textController.text,
                                  //   );
                                  //   print(result);
                                  // });

                                  // if (validations()) {
                                  // if (isM) {
                                  //   resultM = keyCubit.calculateResult(
                                  //     isM: isM,
                                  //     targetedValue: textController.text,
                                  //   );
                                  // } else {
                                  //   resultKey = keyCubit.calculateResult(
                                  //     isM: isM,
                                  //     targetedValue: textController.text,
                                  //   );
                                  // }
                                  // }
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'اكتب مقياس صحيح',
                                          textAlign: TextAlign.center,
                                        ),
                                        backgroundColor:
                                            AppColors.lightRedColor,
                                      ),
                                    );
                                    return 'مطلوب';
                                  }
                                  // else if (value as double <= 0) {
                                  //   showSnackBar(
                                  //     snackText: 'snackText',
                                  //     context: context,
                                  //   );
                                  //   return 'fff';
                                  // }
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
                            label: 'احسب',
                            onPressed: () {
                              calculateResults();
                            },
                            width: context.width / 2,
                            paddingValue: 10,
                            gradient: AppColors.gradientPurple,
                          ),
                          // SizedBox(
                          //   height: 10,
                          // )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    // height: context.height * 0.48,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.greyColor,
                        borderRadius: const BorderRadiusDirectional.only(
                          topStart: Radius.circular(40),
                          topEnd: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                        children: [
                          // result <= 0
                          //     ? Column(
                          //         children: [
                          //           SizedBox(
                          //             height: context.height * 0.2,
                          //           ),
                          //           Text(
                          //             'المقاس ده مش ستاندرد',
                          //             style:
                          //                 context.textList.bodyMedium!.copyWith(
                          //               color: AppColors.whiteColor,
                          //               fontSize: 36,
                          //             ),
                          //           ),
                          //         ],
                          //       )
                          //     : SizedBox(),
                          // if (resultKey > 0 || resultM > 0)
                          if (result > 0)
                            Column(
                              children: [
                                Text(
                                  // '~ ${resultM.toStringAsFixed(1)}',
                                  isM
                                      ? '  mm $result'
                                      : '  مفتاح رقم ${result.toStringAsFixed(0)}',
                                  style: context.textList.bodyMedium!.copyWith(
                                    // color: AppColors.blackTextColor,
                                    fontSize: 36,
                                  ),
                                ),

                                SizedBox(
                                  height: context.height * 0.25,
                                ),
                                // Spacer(),
                                SizedBox(
                                  width: context.width * 0.8,
                                  height: context.height * 0.15,
                                  child: Text(
                                    // '~ ${resultM.toStringAsFixed(1)}',
                                    'كل النتائج اللي موجود في البرنامج ده عباره عن اجتهاد شخصي مني و معرضه للخطأ و اذا وجد خطأ ارجوا المعذره و ابلاغي 01000249042 و سوف يتم التصحيح و ذكر اسم المصحح لو عايز ',
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style:
                                        context.textList.bodyMedium!.copyWith(
                                      color:
                                          AppColors.whiteColor.withOpacity(.4),
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                // Spacer(),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // bool validations() {
  //   if (!formKey.currentState!.validate()) {
  //     return false;
  //   }
  //   if (textController.text.isEmpty) {
  //     return false;
  //   }
  //   var targetedValue = double.tryParse(textController.text)!;
  //   if (targetedValue == 0 || targetedValue < 3) {
  //     return false;
  //   }
  //   return true;
  // }

  calculateResults() {
    if (formKey.currentState!.validate()) {
      var valueIn = double.tryParse(textController.text);
      if (valueIn == null || valueIn == 0 || valueIn < 3) {
        return;
      }

      setState(() {
        if (isM) {
          reference.forEach((key, value) {
            if (valueIn == value) {
              result = key;
            }
            // else {
            // showSnackBar(snackText: 'المقاس ده مش ستاندرد', context: context);
            // }
          });
        } else {
          if (reference[valueIn] == null) {
            return;
          }
          result = reference[valueIn]!;
        }
      });
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  // calculateData() {
  //   double? targetedVal = double.tryParse(textController.text);
  //   if (targetedVal == null) {
  //     // Handle invalid input here.
  //     return;
  //   }

  //   setState(() {
  //     result = 0;
  //     if (isM) {
  //       reference.forEach((key, value) {
  //         if (isApproximatelyEqual(targetedVal, value)) {
  //           result = key;
  //         }
  //       });
  //     } else {
  //       if (reference.containsKey(targetedVal)) {
  //         resultKey = reference[targetedVal]!;
  //         print('${reference[targetedVal]!} 5555555');
  //         print(result);
  //       } else {
  //         print('${reference[targetedVal]!} 5555555');
  //         // Handle case when targetedVal is not in the reference map.
  //       }
  //     }
  //   });
  // }

  // bool isApproximatelyEqual(double a, double b, {double tolerance = 0.0001}) {
  //   return (a - b).abs() < tolerance;
  // }

  // key   => m
  // key of the map
  // value => keySize
  // value of the map is the result

  Map<double, double> reference = {
    3: 5.50,
    4: 7,
    5: 8,
    6: 10,
    8: 13,
    10: 17,
    12: 19,
    14: 21,
    16: 24,
    18: 27,
    20: 30,
    22: 32,
    24: 36,
    27: 41,
    30: 46,
    33: 50,
    36: 55,
    42: 65,
    48: 75,
    52: 85,
    56: 95,
    60: 105,
    64: 115,
    68: 125,
    72: 135,
    76: 145,
    80: 155,
    85: 170,
    90: 185,
    95: 200,
    100: 215
  };
}
