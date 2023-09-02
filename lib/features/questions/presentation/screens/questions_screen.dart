import 'package:cylinders/config/routes/routes.dart';
import 'package:cylinders/core/shared/error_screen.dart';
import 'package:cylinders/core/shared/strings/app_colors.dart';
import 'package:cylinders/core/shared/widgets/top_image_and_name.dart';
import 'package:cylinders/extensions/app_extentions.dart';
import 'package:cylinders/features/questions/domain/entities/question.dart';
import 'package:cylinders/features/questions/presentation/cubit/questions_cubit.dart';
import 'package:cylinders/features/questions/presentation/screens/question_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/strings/app_assets.dart';
import '../../../../core/shared/widgets/default_text_form_field.dart';

class QuestionsScreen extends StatefulWidget {
  QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController problemNameController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController solveingController = TextEditingController();

  @override
  void dispose() {
    problemNameController.dispose();
    descriptionController.dispose();
    solveingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionsCubit, QuestionsState>(
      listener: (context, state) {
        if (state is QuestionsLoadedState) {
          print(state.questions);
        }
      },
      builder: (context, state) {
        final qCubit = QuestionsCubit.get(context);
        if (state is QuestionsLoadedState) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // final q = Question(
                //   ID: null,
                //   name: 'ايه اللي يخلي المكنة تدخن و هي علي الخط؟',
                //   descrition:
                //       'المشكلة دي بتحصل لما يكون في مشكله في اللابرنس او الوش ممكن يكون في اي زيادات او اي رايش حتي لو غير ملحوظ ف بيسحن و بيسخن معاه اي شحم او اي حاجه تعمل الدخنه دي وقت التشغيل. \n و ممكن كمان يكون الدليل لازق او زانق جامد علي السلندر ف هيحمل احتكاك و بالتالي هيعمل سخونة\n او يكون شادد تراحيل و بالتالي تحصل برضو نقس المشكلة',
                //   solve: 'solve',
                //   images: [
                //     'assets/icons/question.png',
                //     'assets/icons/technician.png',
                //   ],
                // );
                // qCubit.addQuestion(q);
                // qCubit.getAllQuestions();
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
                                          'اكتب المشكله و الحل',
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
                                  InkWell(
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        qCubit.addQuestion(
                                          Question(
                                            name: problemNameController.text,
                                            descrition:
                                                descriptionController.text,
                                            solve: solveingController.text,
                                          ),
                                        );
                                      }
                                    },
                                    child: SizedBox(
                                      height: 50,
                                      width: context.width / 2,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: AppColors.lightGreenColor,
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                ).whenComplete(() {
                  problemNameController.clear();
                  descriptionController.clear();
                  solveingController.clear();
                });
              },
            ),
            backgroundColor: AppColors.blackTextColor,
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    const TopImageAndName(),
                    SizedBox(
                      height: context.height * 0.04,
                    ),
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return QuestionWidget(
                            question: state.questions[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: state.questions.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is QuestionsErrorState) {
          return const ErrorScreen();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
    // );
  }
}

class QuestionWidget extends StatelessWidget {
  final Question question;
  const QuestionWidget({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          QuestionDetailsScreen.routeName,
          arguments: question,
        );
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(AppAssets.myImage),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Mahmoud Osman',
                          style: context.textList.bodyMedium!.copyWith(
                            color: AppColors.blackTextColor,
                          ),
                        ),
                        Text(
                          'Programmer',
                          style: context.textList.bodyMedium!.copyWith(
                            color: AppColors.blackTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      question.name,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: context.textList.bodyMedium!.copyWith(
                        color: AppColors.blackTextColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: context.width / 2,
                  height: context.height * 0.2,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Image.asset(
                      AppAssets.questionIconImage,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

showSnackBar({required String snackText, required BuildContext context}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          snackText,
          textAlign: TextAlign.center,
        ),
        backgroundColor: AppColors.lightRedColor,
      ),
    );
