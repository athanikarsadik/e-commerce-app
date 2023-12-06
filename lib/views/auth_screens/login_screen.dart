// ignore_for_file: must_be_immutable

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

import '../../controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var controller = Get.put(AuthController());

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
                CustomTextField(
                    title: email,
                    hint: emailHint,
                    obscure: false,
                    controller: emailController),
                10.h.heightBox,
                CustomTextField(
                    title: password,
                    hint: passwordHint,
                    obscure: true,
                    controller: passwordController),
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
                      try {
                        controller.loginMethod(
                            context: context,
                            email: emailController.text.toString().trim(),
                            password:
                                passwordController.text.toString().trim()).then((value) => {
                                  if(value!=null){
                                    print(value),
                                    VxToast.show(context,
                                        msg: "Logged in successfully!"),
                                    Get.offAll(Home())
                                  }
                                });
                      } catch (e) {
                        VxToast.show(context,
                                        msg: "Something went wrong");
                      }
                    }).box.width(context.screenWidth - 50).make(),
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
