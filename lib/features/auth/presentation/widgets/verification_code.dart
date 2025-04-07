import 'package:flutter/material.dart';
import 'package:task/features/auth/presentation/widgets/verification_code_input.dart';

import '../../../../core/routes/app_routes.dart';

class VerificationCode extends StatelessWidget {
  final bool hasError;

  const VerificationCode({super.key, required this.hasError});

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> controllers =
        List.generate(5, (_) => TextEditingController());

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(5, (index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VerificationCodeInput(
                  controller: controllers[index],
                  hasError: hasError,
                  onChanged: (value) {
                    if (value.length == 1) {
                      if (index < 4) {
                        FocusScope.of(context).nextFocus();
                      } else {
                        FocusScope.of(context).unfocus();
                        Navigator.pushNamed(context, AppRoutes.resetPassword);
                      }
                    }
                  },
                ),
                if (index != 4) const SizedBox(width: 16),
              ],
            );
          }),
        ),
      ),
    );
  }
}
