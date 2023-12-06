import 'package:e_commerce_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget CustomTextField({String? title,String? hint, controller,obscure}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontFamily(semibold).size(16.sp).make(),
      5.h.heightBox,
      TextFormField(
        controller: controller,
        obscureText: obscure!,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle:const TextStyle(fontFamily: semibold, color: textfieldGrey),
            // isDense: true,
            fillColor: lightGrey,
            filled: true,
            border: InputBorder.none,
            focusedBorder:
               const OutlineInputBorder(borderSide: BorderSide(color: redColor))),
      ),
    ],
  );
}
