import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/widgets/buttons/custom_button.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/styles/colors/app_color.dart';
import '../../../../../core/styles/fonts/my_fonts.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

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
              'Reset Password',
              style: AppFonts.styleMedium_18.copyWith(color: AppColor.black),
            ),
            SizedBox(
              height: 14.h,
            ),
            Text(
              'Your password has been successfully reset. Click Confirm to set a new password',
              style:
                  AppFonts.styleMedium_14.copyWith(color: AppColor.lightGray),
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomButton(
              txt: 'Confirmation',
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.updatePassword);
              },
            ),
          ],
        ),
      ),
    );
  }
}
