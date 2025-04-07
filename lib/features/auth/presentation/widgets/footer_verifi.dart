import 'package:flutter/material.dart';

import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/my_fonts.dart';

class FooterVerifi extends StatelessWidget {
  const FooterVerifi({super.key});

  @override
  Widget build(BuildContext context) {
    return    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Didn't get the verification code yet?",
              style: AppFonts.styleMedium_16
                  .copyWith(color: AppColor.lightGray)),
          TextButton(
              onPressed: () {},
              child: Text('Resend code',
                  style: AppFonts.styleMedium_14
                      .copyWith(color: AppColor.orange)))
        ],
      ),
    );
  }
}
