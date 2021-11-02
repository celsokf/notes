import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/theme/app_theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static const _splashDelay = 1;

  @override
  void initState() {
    initializeFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundSecondary,
      body: Container(
        child: Center(
          child: Text(
            'Notes',
            style: AppTheme.textStyles.textBackgroundSecondary,
          ),
        ),
      ),
    );
  }

  void initializeFirebase() async {
    try {
      await Firebase.initializeApp();
      await Future.delayed(Duration(seconds: _splashDelay));
      Navigator.pushReplacementNamed(context, "/login");
    } catch (e) {
      Navigator.pushNamed(context, "/error");
    }
  }
}
