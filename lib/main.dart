import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sap_zeal/pages/splash_page.dart';

import 'package:sap_zeal/router.dart';

import 'constants/global_variables.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EnterpriseONe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: AppColors.primaryColor,
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.getFont(
            'Montserrat',
          ),
          bodyMedium: GoogleFonts.getFont('Montserrat'),
          bodySmall: GoogleFonts.getFont('Montserrat'),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 255, 255, 255),
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
          elevation: 0,
          centerTitle: false,
          // color: secondaryColor,
          titleTextStyle: GoogleFonts.getFont(
            'Montserrat',
            color: Colors.white,
            textStyle: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const SplashPage(),
    );
  }
}
