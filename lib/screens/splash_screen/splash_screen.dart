import 'dart:async';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import '../../themes/app_colors.dart';
import '../onboaring_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) =>const OnboardingScreen(),
      //DashboardScreen(),
      ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Image(
                 fit: BoxFit.cover,
                 image: AssetImage("assets/images/onboarding/Logo.png"))
            ],
          ),
        ),
      ),
    );
  }
}
