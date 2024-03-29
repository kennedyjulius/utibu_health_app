import 'dart:async';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:utibu_health_app/screens/onboarding_screens/onboardingscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..forward();
    // ignore: unnecessary_new
    animation = new CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(Duration(seconds: 4),() => Get.offNamed(OnboardingScreen() as String));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(child: Image.asset("assets/logo1.png", width: 250,)),
          ),

          //second annimation
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                "assets/logo2.png",
                width: 350
              ),
            ),
          )
        ],
      ),
    );
  }
}
