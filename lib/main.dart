import 'package:cylinders/config/routes/app_router.dart';
import 'package:cylinders/config/routes/routes.dart';
import 'package:cylinders/config/theme/light_theme.dart';
import 'package:cylinders/views/screens/get_gap_screen.dart';
import 'package:cylinders/views/screens/get_m_or_screw.dart';
import 'package:cylinders/views/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("ar", "EG"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: const Locale(
        "ar",
        "EG",
      ), // OR Locale('ar', 'AE') OR Other RTL locales,

      debugShowCheckedModeBanner: false,
      title: 'Cylinders By Osman',
      theme: lightTheme,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: Routes.homeRoute,
      // home: const HomeScreen(),
    );
  }
}
