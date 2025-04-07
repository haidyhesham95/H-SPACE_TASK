import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/core/styles/colors/app_color.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/styles/fonts/my_fonts.dart';
import '../../../../../core/utils/widgets/buttons/custom_button.dart';
import '../../../../../generated/assets.dart';

class EntryPointScreen extends StatelessWidget {
  const EntryPointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 55.h,
            ),
            SvgPicture.asset(
              Assets.imagesWork,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 36.h,
            ),
            Text('Cairo Pharma',
                style: AppFonts.styleMedium600_40
                    .copyWith(color: AppColor.baseColor)),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Explore all the existing job roles based on your interest and study major',
              style:
                  AppFonts.styleRegular_14.copyWith(color: AppColor.darkBlack),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  txt: 'Login',
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.loginView);
                  },
                  width: 42.w,
                ),
                CustomButton(
                  txt: 'Sign Up',
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.signUpView);
                  },
                  textColor: AppColor.lightBlack,
                  color: AppColor.background,
                ),
              ],
            ),
            SizedBox(
              height: 55.h,
            ),
          ],
        ),
      ),
    );
  }
}
