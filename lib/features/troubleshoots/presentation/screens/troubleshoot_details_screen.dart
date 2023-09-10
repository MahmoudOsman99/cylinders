import 'package:cylinders/core/shared/strings/app_assets.dart';
import 'package:cylinders/core/shared/strings/app_colors.dart';
import 'package:cylinders/extensions/app_extentions.dart';
import 'package:cylinders/features/troubleshoots/presentation/cubit/troubleshoots_cubit.dart';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/widgets/default_text_form_field.dart';
import '../../domain/entities/troubleshoot.dart';

class TroubleshootDetailsScreen extends StatefulWidget {
  static const routeName = '/troubleshoot-details';
  final Troubleshoot troubleshoot;
  const TroubleshootDetailsScreen({
    super.key,
    required this.troubleshoot,
  });

  @override
  State<TroubleshootDetailsScreen> createState() =>
      _TroubleshootDetailsScreenState();
}

class _TroubleshootDetailsScreenState extends State<TroubleshootDetailsScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController problemNameController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController solveingController = TextEditingController();

  bool isReadOnly = true;

  @override
  void dispose() {
    problemNameController.dispose();
    descriptionController.dispose();
    solveingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TroubleshootsCubit, TroubleshootsState>(
      listener: (context, state) {},
      builder: (context, state) {
        final tCubit = TroubleshootsCubit.get(context);
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.startDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              problemNameController.text = widget.troubleshoot.name;
              descriptionController.text = widget.troubleshoot.descrition;
              solveingController.text = widget.troubleshoot.solve;

              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: context.height * 0.7,
                    width: double.infinity,
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
                                SizedBox(
                                  height: 60,
                                  width: double.infinity,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: AppColors.lightOrangeColor,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'اكتب تعديل المشكلة',
                                        style: context.textList.bodyMedium!
                                            .copyWith(
                                          color: AppColors.blackTextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                DefaultTextFormField(
                                  controller: problemNameController,
                                  isReadOnly: isReadOnly,
                                  label: 'المشكلة',
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return 'اكتب اسم المشكلة';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: context.height * 0.03,
                                ),
                                DefaultTextFormField(
                                  controller: descriptionController,
                                  label: 'وصف المشكلة',
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
                                InkWell(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      if (solveingController.text !=
                                              widget.troubleshoot.solve ||
                                          descriptionController.text !=
                                              widget.troubleshoot.descrition) {
                                        tCubit.updateTroubleshoot(
                                          docID: widget.troubleshoot.ID!,
                                          troubleshoot: Troubleshoot(
                                            name: problemNameController.text,
                                            descrition:
                                                descriptionController.text,
                                            solve: solveingController.text,
                                          ),
                                        );
                                        widget.troubleshoot.descrition =
                                            descriptionController.text;
                                        widget.troubleshoot.solve =
                                            solveingController.text;
                                        Navigator.pop(context);
                                      }
                                    }
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
                                        child: Text('تسسجل المشكلة و الحل'),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            backgroundColor: AppColors.purpleColor,
            child: const Icon(
              Icons.edit,
            ),
          ),
          backgroundColor: AppColors.blackTextColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: context.width,
                      height: context.height * 0.4,
                      child: CarouselSlider(
                        items: [
                          Image.asset(
                            AppAssets.couplingImage,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            AppAssets.lebranceImage,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            AppAssets.finishBackCoverImage,
                            fit: BoxFit.cover,
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                enableDrag: true,
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    height: context.height,
                                    width: context.width,
                                    child: Image.asset(
                                      AppAssets.rougherImage,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              );
                            },
                            child: Image.asset(
                              AppAssets.rougherImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          height: 400,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          onPageChanged: (index, reason) {},
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.1,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('المشكلة:\n'),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            widget.troubleshoot.name,
                          ),
                        ),
                        // Expanded(
                        //   child: Text(
                        //     'المكنة بتدخن اول التشغيل',
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: context.height * 0.05,
                    ),
                    Row(
                      children: [
                        const Text('الحل:\n'),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            widget.troubleshoot.solve,
                          ),
                        ),
                        // Expanded(
                        //   child: Text(
                        //     'ايه اللي يخلي المكنة تدخن في بداية تشغيها و هي علي الخط؟',
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: context.height * 0.05,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('الشرح:'),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(widget.troubleshoot.descrition),
                        ),
                        // Expanded(
                        //   child: Text(
                        //     'المشكلة دي بتحصل لما يكون في مشكله في اللابرنس او الوش ممكن يكون في اي زيادات او اي رايش حتي لو غير ملحوظ ف بيسحن و بيسخن معاه اي شحم او اي حاجه تعمل الدخنه دي وقت التشغيل. \n و ممكن كمان يكون الدليل لازق او زانق جامد علي السلندر ف هيحمل احتكاك و بالتالي هيعمل سخونة\n او يكون شادد تراحيل و بالتالي تحصل برضو نقس المشكلة',
                        //   ),
                        // ),
                      ],
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
