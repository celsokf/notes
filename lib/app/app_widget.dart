import 'package:flutter/material.dart';
import 'package:notes/modules/error/error_page.dart';
import 'package:notes/modules/home/home_page.dart';
import 'package:notes/modules/login/login_page.dart';
import 'package:notes/modules/notes/create_note_page.dart';
import 'package:notes/modules/splash/splash_page.dart';
import 'package:notes/theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: AppTheme.colors.primarySwatch,
      ),
      title: "Notes",
      initialRoute: "/splash",
      routes: {
        "/home": (context) => HomePage(),
        "/create-note": (context) => CreateNotePage(),
        "/splash": (context) => SplashPage(),
        "/login": (context) => LoginPage(),
        "/error": (context) => ErrorPage(),
      },
    );
  }
}
