import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/routes/app_routes.dart';
import 'package:task/core/styles/colors/app_color.dart';
import 'package:task/generated/assets.dart';

import '../../../../../core/styles/fonts/my_fonts.dart';
import '../../../../../core/utils/widgets/buttons/custom_button.dart';

class RegisterConfirmationScreen extends StatelessWidget {
  const RegisterConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              Assets.imagesRegisterConfirmation,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 230.h,
              left: 40.w,
              right: 40.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'Your details have been sent to the company and you will be contacted by a representative of the company',
                  style: AppFonts.styleMedium600_16
                      .copyWith(color: AppColor.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              bottom: 150.h,
              left: 40.w,
              right: 40.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: CustomButton(
                  txt: 'Done',
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.loginView);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
