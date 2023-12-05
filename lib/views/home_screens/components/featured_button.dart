import 'package:e_commerce_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget featuredButton({String? title,img}) {
  return Row(
    children: [
      Image.asset(img,width: 60.w,fit: BoxFit.fill,),
      10.w.widthBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make()
    ],
  ).box.white.width(200.w).margin(EdgeInsets.symmetric(horizontal: 4.w)).padding(EdgeInsets.all(4)).roundedSM.outerShadowSm.make();
}
