import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/widgets/buttons/custom_button.dart';
import 'package:task/features/auth/presentation/widgets/text_field_widget.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/styles/colors/app_color.dart';
import '../../../../../core/styles/fonts/my_fonts.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: customAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Text('Set a new password',
                    style:
                        AppFonts.styleMedium_18.copyWith(color: AppColor.black)),
                SizedBox(height: 14.h),
                Text(
                  'Create a new password. Make sure it is different from the previous one for security',
                  style:
                      AppFonts.styleMedium_14.copyWith(color: AppColor.lightGray),
                ),
                SizedBox(height: 15.h),
                Text('Password',
                    style: AppFonts.styleBold_16
                        .copyWith(color: AppColor.mediumBlack)),
                SizedBox(height: 14.h),
                TextFieldWidget(
                  hintTxt: 'Enter your new password',
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                Text('Confirm Password',
                    style: AppFonts.styleBold_16
                        .copyWith(color: AppColor.mediumBlack)),
                SizedBox(height: 14.h),
                TextFieldWidget(
                  hintTxt: 'Re-enter the password',
                  controller: _confirmPasswordController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30.h),
                CustomButton(
                  txt: 'Update Password',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, AppRoutes.congratulation);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
