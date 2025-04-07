import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routes/app_routes.dart';
import 'core/services/connectivity_controller.dart';
import 'core/utils/screens/no_network_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/presentation/view_model/auth_cubit.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class FarmaApp extends StatelessWidget {
  const FarmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (context, value, child) {
        if (value) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MultiBlocProvider( // إضافة الـ MultiBlocProvider هنا
              providers: [
                BlocProvider<AuthCubit>(
                  create: (context) => AuthCubit(),
                ),
              ],
              child: MaterialApp(
                initialRoute: AppRoutes.splash,
                debugShowCheckedModeBanner: false,
                builder: (context, child) {
                  return Scaffold(
                    resizeToAvoidBottomInset: false,
                    body: Builder(
                      builder: (context) {
                        ConnectivityController.instance.init();
                        return child!;
                      },
                    ),
                  );
                },
                onGenerateRoute: AppRoutes.onGenerateRoute,
                navigatorKey: navigatorKey,
              ),
            ),
          );
        } else {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: NoNetworkScreen(),
          );
        }
      },
    );
  }
}
