import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/styles/colors/app_color.dart';
import 'package:task/core/styles/fonts/my_fonts.dart';
import 'package:task/core/utils/widgets/buttons/custom_button.dart';
import 'package:task/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:task/core/utils/widgets/custom_text_form_field.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/widgets/custom_toast.dart';
import '../../view_model/auth_state.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthAuthenticated) {
                CustomToast.showSuccessToast(
                    message: 'Account created successfully');
                Navigator.pushReplacementNamed(
                    context, AppRoutes.registrationView);
              } else if (state is AuthUnauthenticated && state.error != null) {
                CustomToast.showErrorToast(message: state.error!);
              }
            },
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 55.h),
                    Text('Create Account',
                        style: AppFonts.styleBold600_30
                            .copyWith(color: AppColor.baseColor)),
                    SizedBox(height: 6.h),
                    Text(
                      'Create an account so you can explore all the existing jobs',
                      style: AppFonts.styleMedium_14
                          .copyWith(color: AppColor.black),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 50.h),
                    CustomTextFormField(
                      hintTxt: 'Email',
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
                    SizedBox(height: 24.h),
                    CustomTextFormField(
                      hintTxt: 'Password',
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
                    CustomTextFormField(
                      hintTxt: 'Confirm Password',
                      controller: _confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 50.h),
                    if (state is AuthLoading)
                      const CircularProgressIndicator()
                    else
                      CustomButton(
                        txt: 'Sign Up',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthCubit>().signUp(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  confirmPassword:
                                      _confirmPasswordController.text,
                                );
                          }
                        },
                      ),
                    SizedBox(height: 35.h),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.loginView);
                      },
                      child: Text(
                        'Already have an account',
                        style: AppFonts.styleMedium600_14
                            .copyWith(color: AppColor.darkGray),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
