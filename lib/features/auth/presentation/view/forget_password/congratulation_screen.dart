import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/generated/assets.dart';

import '../../../../../core/styles/colors/app_color.dart';
import '../../../../../core/styles/fonts/my_fonts.dart';
import '../../../../../core/utils/widgets/buttons/custom_button.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Image.asset(Assets.imagesCheckBlue ),

              SizedBox(
                height: 130.h,
              ),
              Text(
                'Congratulations! Your password has been changed. Click Continue to log in',
                style:
                    AppFonts.styleMedium_16.copyWith(color: AppColor.lightGray),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 34.h,
              ),
              CustomButton(txt: 'Follow-up', onPressed: () {}),
            ],
          ),
        ));
  }
}
