import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:e_commerce_app/views/auth_screens/signup_screen.dart';
import 'package:e_commerce_app/views/home_screens/home.dart';
import 'package:e_commerce_app/widgets_common/applogo_widget.dart';
import 'package:e_commerce_app/widgets_common/bg_widget.dart';
import 'package:e_commerce_app/widgets_common/button.dart';
import 'package:e_commerce_app/widgets_common/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appLogoWidget(),
            10.h.heightBox,
            "Log in to $appname".text.fontFamily(bold).size(18.sp).white.make(),
            15.h.heightBox,
            Column(
              children: [
                CustomTextField(title: email, hint: emailHint),
                10.h.heightBox,
                CustomTextField(title: password, hint: passwordHint),
                10.h.heightBox,
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetPass.text.make())),
                10.h.heightBox,
                ourButton(
                        color: redColor,
                        title: login,
                        textColor: whiteColor,
                        onPress: () {
                          Get.to(()=> Home());
                        })
                    .box
                    .width(context.screenWidth - 50)
                    .make(),
                10.h.heightBox,
                createNewAccount.text.color(fontGrey).make(),
                10.h.heightBox,
                ourButton(
                    color: lightGolden,
                    title: signUp,
                    textColor: redColor,
                    onPress: () {
                      Get.off(() => const SignUpScreen());
                    }).box.width(context.screenWidth - 50).make(),
                10.h.heightBox,
                loginWith.text.color(fontGrey).make(),
                10.h.heightBox,
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => Padding(
                              padding: EdgeInsets.all(10.h),
                              child: CircleAvatar(
                                radius: 25.r,
                                backgroundColor: lightGrey,
                                child: Image.asset(socialIconList[index]),
                              ),
                            )))
              ],
            )
                .box
                .white
                .rounded
                .shadowSm
                .padding(EdgeInsets.all(16.sp))
                .width(context.screenWidth - 50)
                .make(),
          ],
        ),
      ),
    ));
  }
}
