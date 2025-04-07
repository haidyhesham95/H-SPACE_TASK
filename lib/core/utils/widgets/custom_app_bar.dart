import 'package:flutter/material.dart';

import '../../../generated/assets.dart';
import '../../styles/colors/app_color.dart';

AppBar customAppBar ( BuildContext context) {
  return AppBar(
    backgroundColor: AppColor.background,
    leading: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Image.asset(
        Assets.imagesArrowBack,
      ),
    ),
  );
}