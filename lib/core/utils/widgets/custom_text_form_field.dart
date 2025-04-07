import 'package:flutter/material.dart';
import 'package:task/core/styles/colors/app_color.dart';
import '../../styles/fonts/my_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintTxt,
      this.controller,
      this.validator,
      this.suffixIcon,
      this.isPassword,
      this.onFieldSubmitted,
      this.prefixIcon,
      this.prefixIconColor,
      this.keyboardType});

  final String hintTxt;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon, prefixIcon;
  final bool? isPassword;
  final void Function(String)? onFieldSubmitted;
  final Color? prefixIconColor;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        obscureText: isPassword ?? false,
        cursorColor: AppColor.baseColor,
        style: AppFonts.styleMedium_16.copyWith(color: AppColor.mediumGray),
        validator: validator,
        controller: controller,
        textAlign: TextAlign.start,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.lightPurple,
          suffixIcon: suffixIcon,
          // contentPadding: EdgeInsets.zero,
          prefixIcon: prefixIcon,
          prefixIconColor: prefixIconColor ?? AppColor.gray,
          hintStyle: AppFonts.styleMedium_16.copyWith(color: AppColor.mediumGray),
          hintText: hintTxt,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColor.lightPurple), //borderGray
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColor.baseColor), //borderGray
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),

            borderSide: BorderSide(color: AppColor.lightPurple), //borderGray
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),

            borderSide: BorderSide(color: AppColor.lightPurple), //borderGray
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),

            borderSide: BorderSide(color: AppColor.lightPurple), //borderGray
          ), //borderGray
        ),
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
