import 'package:cylinders/config/routes/routes.dart';
import 'package:cylinders/features/gap_feature/presentation/screens/get_gap_screen.dart';
import 'package:cylinders/features/questions/presentation/cubit/questions_cubit.dart';
import 'package:cylinders/features/screw_m/presentation/screens/get_m_or_screw.dart';
import 'package:cylinders/home.dart';
import 'package:cylinders/features/questions/presentation/screens/question_details_screen.dart';
import 'package:cylinders/features/questions/presentation/screens/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/questions/domain/entities/question.dart';
import '../../injection_container.dart' as di;

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.screwAndMRoute:
        return MaterialPageRoute(
          builder: (context) => const GetMOrScrew(),
        );

      case Routes.gapAndSpringRoute:
        return MaterialPageRoute(
          builder: (context) => const GetGapScreen(),
        );
      case Routes.questionRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) {
              return di.sl<QuestionsCubit>()..getAllQuestions();
            },
            child: QuestionsScreen(),
          ),
          //  const QuestionsScreen(),
        );
      case QuestionDetailsScreen.routeName:
        final args = settings.arguments as Question;
        return MaterialPageRoute(
          builder: (context) => QuestionDetailsScreen(question: args),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }
  }
}
