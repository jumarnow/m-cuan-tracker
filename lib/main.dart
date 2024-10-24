import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/config/app_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/config/app_route.dart';
import 'package:myapp/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: AppColor.backgroundScaffold,
        primaryColor: AppColor.primary,
        colorScheme: const ColorScheme.light(
          primary: AppColor.primary,
          secondary: AppColor.secondary,
        ),
      ),
      
      routes: {
        AppRoute.home: (context) => HomePage(),
      },
    );
  }
}