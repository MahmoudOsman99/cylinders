import 'package:cylinders/config/routes/routes.dart';
import 'package:cylinders/features/bearing_types/domain/entities/bearing_entity.dart';
import 'package:cylinders/features/bearing_types/presentation/cubit/bearing_types_cubit.dart';
import 'package:cylinders/features/bearing_types/presentation/screens/add_bearing_screen.dart';
import 'package:cylinders/features/bearing_types/presentation/screens/bearing_types_screen.dart';
import 'package:cylinders/features/gap_feature/presentation/screens/get_gap_screen.dart';
import 'package:cylinders/features/screw_m/presentation/cubit/key_m_cubit.dart';

import 'package:cylinders/features/screw_m/presentation/screens/get_m_or_key.dart';
import 'package:cylinders/features/troubleshoots/domain/entities/troubleshoot.dart';
import 'package:cylinders/features/troubleshoots/presentation/screens/handle_troubleshoot_screen.dart';
import 'package:cylinders/features/troubleshoots/presentation/screens/troubleshoots_screen.dart';
import 'package:cylinders/home.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/bearing_types/presentation/screens/bearing_type_details_screen.dart';
import '../../features/troubleshoots/presentation/cubit/troubleshoots_cubit.dart';
import '../../features/troubleshoots/presentation/screens/troubleshoot_details_screen.dart';
import '../../injection_container.dart' as di;

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.screwAndMRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => di.sl<KeyAndMCubit>(),
            child: const GetMOrScrew(),
          ),
        );

      case Routes.gapAndSpringRoute:
        return MaterialPageRoute(
          builder: (context) => const GetGapScreen(),
        );
      case TroubleshootsScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) {
              return di.sl<TroubleshootsCubit>()..getAllTroubleshoots();
            },
            child: const TroubleshootsScreen(),
          ),
          //  const QuestionsScreen(),
        );
      case TroubleshootDetailsScreen.routeName:
        final args = settings.arguments as Troubleshoot;
        return MaterialPageRoute(
          builder: (context) => TroubleshootDetailsScreen(troubleshoot: args),
        );
      case HandleTroubleshootScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const HandleTroubleshootScreen(),
        );
      case BearingTypeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => BearingTypeScreen(),
        );
      case AddBearingScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => di.sl<BearingTypesCubit>(),
            child: AddBearingScreen(),
          ),
        );
      case BearingTypeDetailsScreen.routeName:
        final args = settings.arguments as Bearing;
        return MaterialPageRoute(
          builder: (context) => BearingTypeDetailsScreen(bearing: args),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }
  }
}
