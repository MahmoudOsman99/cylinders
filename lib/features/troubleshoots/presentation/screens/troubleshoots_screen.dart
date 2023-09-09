import 'package:cylinders/core/shared/error_screen.dart';
import 'package:cylinders/core/shared/strings/app_colors.dart';
import 'package:cylinders/core/shared/widgets/top_image_and_name.dart';
import 'package:cylinders/extensions/app_extentions.dart';
import 'package:cylinders/features/troubleshoots/presentation/screens/handle_troubleshoot_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/troubleshoots_cubit.dart';
import '../widgets/troubleshoot_widget.dart';

// import 'dart:io';

class TroubleshootsScreen extends StatefulWidget {
  const TroubleshootsScreen({super.key});
  static const routeName = 'troubleshoot';

  @override
  State<TroubleshootsScreen> createState() => _TroubleshootsScreenState();
}

class _TroubleshootsScreenState extends State<TroubleshootsScreen> {
  final formKey = GlobalKey<FormState>();

  // TextEditingController problemNameController = TextEditingController();

  // TextEditingController descriptionController = TextEditingController();

  // TextEditingController solveingController = TextEditingController();

  @override
  void dispose() {
    // problemNameController.dispose();
    // descriptionController.dispose();
    // solveingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TroubleshootsCubit, TroubleshootsState>(
      listener: (context, state) {
        if (state is TroubleshootsLoadedState) {
          // print(state.troubleshoots);
        }
      },
      builder: (context, state) {
        final tCubit = TroubleshootsCubit.get(context);
        if (state is TroubleshootsLoadedState) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.lightOrangeColor,
              child: const Icon(Icons.add),
              onPressed: () async {
                Navigator.pushNamed(
                    context, HandleTroubleshootScreen.routeName);
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
                      child: RefreshIndicator(
                        onRefresh: () async {
                          // return Future.delayed(
                          //   const Duration(seconds: 1),
                          //   () async {
                          //     await tCubit.getAllTroubleshoots();
                          //   },
                          // );
                        },
                        child: ListView.separated(
                          // physics: const BouncingScrollPhysics(),
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return TroubleshootWidget(
                              troubleshoot: state.troubleshoots[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: state.troubleshoots.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is TroubleshootsErrorState) {
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
