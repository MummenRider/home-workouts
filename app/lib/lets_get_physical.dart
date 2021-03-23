import 'package:app/app/app.router.dart';
import 'package:app/config/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_services/stacked_services.dart';

class LetsGetPhysical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: ColorPalette.scaffold,
        iconTheme: IconThemeData(color: Colors.black),
        primaryTextTheme: TextTheme(
          headline5: GoogleFonts.montserrat(color: Colors.black87),
          headline6: GoogleFonts.montserrat(color: Colors.black87),
        ),
      ),
    );
  }
}
