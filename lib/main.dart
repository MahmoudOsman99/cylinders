import 'package:cylinders/config/routes/app_router.dart';
import 'package:cylinders/config/routes/routes.dart';
import 'package:cylinders/config/theme/light_theme.dart';
import 'package:cylinders/features/gap_feature/presentation/cubit/gap_cubit.dart';
import 'package:cylinders/features/troubleshoots/presentation/cubit/troubleshoots_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './injection_container.dart' as di;

import 'BlocObserver.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => GapCubit(),
        // ),
        BlocProvider(
          create: (context) => di.sl<TroubleshootsCubit>(),
        ),
      ],
      child: MaterialApp(
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
        // home: const Test(),
      ),
    );
  }
}
