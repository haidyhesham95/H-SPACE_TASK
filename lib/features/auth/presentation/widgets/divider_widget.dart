import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/styles/colors/app_color.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: width ,
      decoration: BoxDecoration(
        color: AppColor.baseColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
