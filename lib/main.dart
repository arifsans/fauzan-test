import 'package:fauzan_test/src/core/router/router.dart';
import 'package:fauzan_test/src/core/styles/app_colors.dart';
import 'package:fauzan_test/src/core/utils/injections.dart';
import 'package:fauzan_test/src/features/intro/presentation/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initInjections();

  runApp(
    const MyApp(),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fauzan Test',
      navigatorKey: navigatorKey,
      onGenerateRoute: AppRouter.generateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      home: const IntroPage(),
    );
  }
}
