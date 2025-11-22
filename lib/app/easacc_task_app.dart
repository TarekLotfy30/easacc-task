import 'package:easacc_task/core/routing/app_router.dart';
import 'package:easacc_task/core/routing/app_routes_name.dart';
import 'package:easacc_task/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EasaccTaskApp extends StatelessWidget {
  const EasaccTaskApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: AppColors.primary,
        ),
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => AppRouter().generateRoute(settings),
      initialRoute: AppRoutesName.loginScreen,
    );
  }
}
