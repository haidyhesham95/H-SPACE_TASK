import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/styles/colors/app_color.dart';

import '../../../../core/styles/fonts/my_fonts.dart';
import '../widgets/divider_widget.dart';

class UpperRegistrationSection extends StatelessWidget {
  const UpperRegistrationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text('Complete the registration',
              style:
                  AppFonts.styleMedium600_20.copyWith(color: AppColor.black)),
          SizedBox(
            height: 9.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DividerWidget(
                width: 46.w,
              ),
              SizedBox(
                width: 5.w,
              ),
              DividerWidget(
                width: 27.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
