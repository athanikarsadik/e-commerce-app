import 'package:e_commerce_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget detailsCard({width, String? cnt, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      cnt!.text.fontFamily(bold).color(darkFontGrey).size(16.sp).make(),
      5.h.heightBox,
      title!.text.color(darkFontGrey).make()
    ],
  )
      .box
      .white
      .rounded
      .height(80.h)
      .width(width)
      .padding(EdgeInsets.all(4.w))
      .make();
}
