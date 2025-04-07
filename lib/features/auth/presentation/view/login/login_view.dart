import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/styles/colors/app_color.dart';
import 'package:task/core/styles/fonts/my_fonts.dart';
import 'package:task/core/utils/widgets/buttons/custom_button.dart';
import 'package:task/core/utils/widgets/custom_text_form_field.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/widgets/custom_toast.dart';
import '../../view_model/auth_cubit.dart';
import '../../view_model/auth_state.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

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
              } else if (state is AuthUnauthenticated && state.error != null) {
                CustomToast.showErrorToast(message: state.error.toString());
              }
            },
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 55.h),
                    Text('Login here',
                        style: AppFonts.styleBold600_30
                            .copyWith(color: AppColor.baseColor)),
                    SizedBox(height: 24.h),
                    Text(
                      " Welcome back you've been missed!",
                      style: AppFonts.styleMedium600_20
                          .copyWith(color: AppColor.black),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 76.h),
                    CustomTextFormField(
                      hintTxt: 'Email',
                      controller: emailController,
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
                    SizedBox(height: 27.h),
                    CustomTextFormField(
                      hintTxt: 'Password',
                      controller: passwordController,
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
                    SizedBox(height: 30.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.passwordRecovery);
                        },
                        child: Text('Forgot your password?',
                            style: AppFonts.styleMedium600_14
                                .copyWith(color: AppColor.baseColor)),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    if (state is AuthLoading)
                      const CircularProgressIndicator()
                    else
                      CustomButton(
                        txt: 'Sign In',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthCubit>().login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                          }
                        },
                      ),
                    SizedBox(height: 35.h),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.signUpView);
                      },
                      child: Text(
                        'Create new account',
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
