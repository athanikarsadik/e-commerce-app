import 'package:e_commerce_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget appLogoWidget() {
  return Image.asset(icAppLogo)
      .box
      .size(77.h, 77.h)
      .padding(EdgeInsets.all(8.sp))
      .rounded
      .white
      .make();
}
