import 'package:cylinders/config/routes/routes.dart';
import 'package:cylinders/views/screens/get_gap_screen.dart';
import 'package:cylinders/views/screens/get_m_or_screw.dart';
import 'package:cylinders/views/screens/home.dart';
import 'package:flutter/material.dart';

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
      default:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }
  }
}
