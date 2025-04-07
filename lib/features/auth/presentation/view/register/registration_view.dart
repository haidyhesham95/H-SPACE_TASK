import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/routes/app_routes.dart';
import 'package:task/core/styles/colors/app_color.dart';
import 'package:task/core/utils/widgets/custom_toast.dart';
import 'package:task/features/auth/presentation/widgets/file_attachment_row.dart';

import '../../../../../core/styles/fonts/my_fonts.dart';
import '../../../../../core/utils/widgets/buttons/custom_button.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/upper_registration_section.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  _RegistrationViewState createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              UpperRegistrationSection(),
              SizedBox(
                height: 24.h,
              ),
              Text('Name',
                  style:
                      AppFonts.styleBold600_18.copyWith(color: AppColor.black)),
              SizedBox(
                height: 7.h,
              ),
              CustomContainer(),

              SizedBox(
                height: 12.h,
              ),
              Text('Name of the pharmacy',
                  style:
                      AppFonts.styleBold600_18.copyWith(color: AppColor.black)),
              SizedBox(
                height: 7.h,
              ),
              CustomContainer(),

              SizedBox(
                height: 12.h,
              ),
              Text('Pharmacy address',
                  style:
                      AppFonts.styleBold600_18.copyWith(color: AppColor.black)),
              SizedBox(
                height: 7.h,
              ),
              CustomContainer(),
              SizedBox(height: 45.h),
              FileAttachmentRow(labelText: "Trade Register"),
              FileAttachmentRow(labelText: "Tax Card"),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (val) {
                      setState(() {
                        isChecked = val!;
                      });
                    },
                  ),
                  Flexible(
                    child: Text(
                      "I agree that the data entered is correct",
                      style: AppFonts.styleMedium600_16
                          .copyWith(color: AppColor.black),
                    ),
                  )
                ],
              ),
              SizedBox(height: 35.h),
              CustomButton(
                txt: 'Registration',
                onPressed: isChecked
                    ? () {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.registerConfirmationScreen);
                      }
                    : () => CustomToast.showErrorToast(
                        message: "Please check the checkbox"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
