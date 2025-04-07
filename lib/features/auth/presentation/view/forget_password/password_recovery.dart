import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/routes/app_routes.dart';
import 'package:task/core/utils/widgets/buttons/custom_button.dart';
import 'package:task/features/auth/presentation/widgets/text_field_widget.dart';

import '../../../../../core/styles/colors/app_color.dart';
import '../../../../../core/styles/fonts/my_fonts.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../../generated/assets.dart';

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({super.key});

  @override
  State<PasswordRecovery> createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _sendOtp() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() => _isLoading = false);

      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Image.asset(Assets.imagesCheckGreen),
          content: Text("Verification code has been sent"),
          contentTextStyle: AppFonts.styleMedium_14.copyWith(color: AppColor.black),
        ),
      );

      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.otpView);
      }

    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Text(
                  'Password Recovery',
                  style:
                      AppFonts.styleMedium_18.copyWith(color: AppColor.black),
                ),
                SizedBox(height: 14.h),
                Text(
                  'Please enter your email to receive OTP for password reset',
                  style: AppFonts.styleMedium_14
                      .copyWith(color: AppColor.lightGray),
                ),
                SizedBox(height: 14.h),
                Text(
                  'Your phone number',
                  style: AppFonts.styleBold_16
                      .copyWith(color: AppColor.mediumBlack),
                ),
                SizedBox(height: 14.h),
                TextFieldWidget(
                  hintTxt: '',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!EmailValidator.validate(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30.h),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : CustomButton(
                        txt: 'Send OTP',
                        onPressed: _sendOtp,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
