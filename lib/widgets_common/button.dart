import 'package:e_commerce_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget ourButton({String ?title,color,textColor,onPress}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color,
      padding: EdgeInsets.all(12.h)
    ),
      onPressed: onPress, child: title!.text.color(textColor).fontFamily(bold).make());
}
