import 'package:flutter/material.dart';
import 'package:task/features/auth/presentation/view/login/entry_point_screen.dart';
import 'package:task/features/auth/presentation/view/login/login_view.dart';
import 'package:task/features/auth/presentation/view/forget_password/otp_view.dart';
import 'package:task/features/auth/presentation/view/register/sign_up_view.dart';
import 'package:task/core/utils/screens/splash_screen.dart';

import '../../features/auth/presentation/view/forget_password/congratulation_screen.dart';
import '../../features/auth/presentation/view/forget_password/password_recovery.dart';
import '../../features/auth/presentation/view/register/register_confirmation_screen.dart';
import '../../features/auth/presentation/view/register/registration_view.dart';
import '../../features/auth/presentation/view/forget_password/reset_password.dart';
import '../../features/auth/presentation/view/forget_password/update_password.dart';
import '../utils/screens/under_build_screen.dart';
import 'base_routes.dart';

class AppRoutes {
  // static const String onBoarding = '/';
  static const String splash = "splashScreen";
  static const String loginView = "loginView";
  static const String signUpView = "signUpView";
  static const String entryPointScreen = "entryPointScreen";
  static const String registerConfirmationScreen = "registerConfirmationScreen";
  static const String registrationView = "registrationView";
  static const String passwordRecovery = "passwordRecovery";
  static const String otpView = "otpView";
  static const String resetPassword = "ResetPassword";
   static const String updatePassword = "updatePassword";
   static const String congratulation = "congratulationScreen";

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case splash:
        return BaseRoute(page: SplashScreen());
      case loginView:
        return BaseRoute(page: LoginView());
      case signUpView:
        return BaseRoute(page: SignUpView());
      case entryPointScreen:
        return BaseRoute(page: const EntryPointScreen());
      case registerConfirmationScreen:
        return BaseRoute(page: const RegisterConfirmationScreen());
      case registrationView:
        return BaseRoute(page: const RegistrationView());
      case passwordRecovery:
        return BaseRoute(page: const PasswordRecovery());
      case otpView:
        return BaseRoute(page: const OtpView());
      case resetPassword :
        return BaseRoute(page: const ResetPassword());
      case updatePassword:
        return BaseRoute(page: const UpdatePassword());
      case congratulation:
        return BaseRoute(page: const CongratulationScreen());


      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
