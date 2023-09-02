import 'package:cylinders/core/shared/widgets/top_image_and_name.dart';
import 'package:cylinders/extensions/app_extentions.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/strings/app_assets.dart';
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
  double resultScrew = 0;
  double resultM = 0;

  @override
  Widget build(BuildContext context) {
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
                                resultScrew = 0;
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
                                    style:
                                        context.textList.bodyMedium!.copyWith(
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
                                resultScrew = 0;
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
                                    style:
                                        context.textList.bodyMedium!.copyWith(
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
                              calculateResults();
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'اكتب مقياس صحيح',
                                      textAlign: TextAlign.center,
                                    ),
                                    backgroundColor: AppColors.lightRedColor,
                                  ),
                                );
                                // return 'اكتب قطر صحيح';
                              }
                              //  else if (double.tryParse(value)! > 275) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //       content: Text(
                              //         'القطر اكبر من الاستاندرد',
                              //         textAlign: TextAlign.center,
                              //       ),
                              //       backgroundColor: AppColors.lightRedColor,
                              //     ),
                              //   );
                              // } else if (double.tryParse(value)! < 244) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //       content: Text(
                              //         'القطر اصغر من المسموح بيه 244',
                              //         textAlign: TextAlign.center,
                              //       ),
                              //       backgroundColor: AppColors.lightRedColor,
                              //     ),
                              //   );
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
                      InkWell(
                        onTap: () {
                          calculateResults();
                          //   if (value <= 275 && value >= 268) {
                          //     springCount = 48;
                          //   } else if (value < 268 && value >= 260) {
                          //     springCount = 46;
                          //   } else if (value < 260 && value >= 255) {
                          //     springCount = 44;
                          //   } else if (value < 255 && value >= 250) {
                          //     springCount = 42;
                          //   } else {
                          //     springCount = 40;
                          //   }
                          //   if (isFlat && springCount != 48) {
                          //     springCount += 2;
                          //   }
                          // }
                        },
                        child: SizedBox(
                          height: 50,
                          width: context.width / 2,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.lightGreenColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Center(
                              child: Text('احسب'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: context.height * 0.7,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(40),
                      topEnd: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      if (resultM > 0 || resultScrew > 0)
                        Column(
                          children: [
                            Text(
                              // '~ ${resultM.toStringAsFixed(1)}',
                              isM
                                  ? '~  mm ${resultM.floor()}'
                                  : '~  مفتاح رقم ${resultScrew.toStringAsFixed(0)}',
                              style: context.textList.bodyMedium!.copyWith(
                                color: AppColors.blackTextColor,
                                fontSize: 36,
                              ),
                            ),
                            SizedBox(
                              height: context.height * 0.02,
                            ),
                            SizedBox(
                              width: context.width * 0.7,
                              child: Text(
                                // '~ ${resultM.toStringAsFixed(1)}',
                                !isM
                                    ? 'مقاس المفتاح بييجي عن طريق قيمة ال M و بتجمع عليها 50% او نصف قيمة ال M'
                                    : 'ال M بيجي عن طريق قسمة مقاس المفتاح علي 3 و هيطلع ناتج نضربه في 2 يبقي ده ال M اللي انت عايزه ',
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: context.textList.bodyMedium!.copyWith(
                                  color: AppColors.blackTextColor,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: context.height * 0.15,
                            ),
                            SizedBox(
                              width: context.width * 0.8,
                              child: Text(
                                // '~ ${resultM.toStringAsFixed(1)}',
                                'كل النتائج اللي موجود في البرنامج ده عباره عن اجتهاد شخصي مني و معرضه للخطأ و اذا وجد خطأ ارجوا المعذره و ابلاغي 01000249042 و سوف يتم التصحيح و ذكر اسم المصحح لو عايز ',
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: context.textList.bodyMedium!.copyWith(
                                  color:
                                      AppColors.blackTextColor.withOpacity(.4),
                                  fontSize: 15,
                                ),
                              ),
                            ),
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
  }

  calculateResults() {
    if (formKey.currentState!.validate()) {
      var value = double.tryParse(textController.text);
      if (value == null || value == 0 || value < 6) {
        return;
      }
      setState(() {
        if (isM) {
          resultM = (value / 3) * 2;
        } else {
          resultScrew = value + (value / 2);
        }
      });
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
