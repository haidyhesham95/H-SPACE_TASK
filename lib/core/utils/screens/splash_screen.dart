import 'package:flutter/material.dart';
import 'package:task/core/styles/colors/app_color.dart';
import 'dart:async';

import '../../routes/app_routes.dart';
import '../../../generated/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.entryPointScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Center(
        child: Image.asset(
          Assets.imagesLogo,
        fit: BoxFit.fill,
        ),
      ),
    );
  }
}
