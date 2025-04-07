import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/widgets/buttons/custom_button.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/styles/colors/app_color.dart';
import '../../../../../core/styles/fonts/my_fonts.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../widgets/footer_verifi.dart';
import '../../widgets/verification_code.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: customAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Verify your phone number',
              style:
                  AppFonts.styleBold_16.copyWith(color: AppColor.mediumBlack),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'We have sent a message with a verification code, please check it to complete the password recovery',
              style:
                  AppFonts.styleMedium_14.copyWith(color: AppColor.lightGray),
            ),
            SizedBox(
              height: 15.h,
            ),
            VerificationCode(
              hasError: false,
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomButton(
              txt: 'Code Verification',
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.resetPassword);
              },
            ),
            SizedBox(
              height: 25.h,
            ),
            FooterVerifi(),
          ],
        ),
      ),
    );
  }
}
