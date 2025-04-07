import 'package:flutter/material.dart';
import 'package:task/core/styles/colors/app_color.dart';

import '../../../../core/styles/fonts/my_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
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
        style: AppFonts.styleMedium_14.copyWith(color: AppColor.primary),
        validator: validator,
        controller: controller,
        textAlign: TextAlign.start,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.background,
          suffixIcon: suffixIcon,
          // contentPadding: EdgeInsets.zero,
          prefixIcon: prefixIcon,
          prefixIconColor: prefixIconColor ?? AppColor.gray,
          hintStyle: AppFonts.styleMedium_14.copyWith(color: AppColor.primary),
          hintText: hintTxt,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColor.primary2), //borderGray
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColor.primary2), //borderGray
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),

            borderSide: BorderSide(color: AppColor.primary2), //borderGray
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),

            borderSide: BorderSide(color: AppColor.primary2), //borderGray
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),

            borderSide: BorderSide(color: AppColor.primary2), //borderGray
          ), //borderGray
        ),
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
