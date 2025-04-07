import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors/app_color.dart';


class VerificationCodeInput extends StatelessWidget {
  final TextEditingController controller;
  final bool hasError;
  final Function(String value) onChanged;

  const VerificationCodeInput({
    super.key,
    required this.controller,
    required this.hasError,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      height: 50.h,
      child: Center(
        child: TextFormField(
          maxLength: 1,
          controller: controller,
          onChanged: onChanged,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.background,
            counterText: '',
            border:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:  BorderSide(color: AppColor.primary2), //borderGray
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:  BorderSide(color: AppColor.primary2), //borderGray
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:  BorderSide(color: AppColor.primary2), //borderGray
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:  BorderSide(color: AppColor.primary2), //borderGray
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:  BorderSide(color: AppColor.primary2), //borderGray
              ), //borderGray
            ),

          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}
