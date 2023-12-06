import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:e_commerce_app/views/auth_screens/login_screen.dart';
import 'package:e_commerce_app/views/home_screens/home.dart';
import 'package:e_commerce_app/widgets_common/applogo_widget.dart';
import 'package:e_commerce_app/widgets_common/bg_widget.dart';
import 'package:e_commerce_app/widgets_common/button.dart';
import 'package:e_commerce_app/widgets_common/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var controller = Get.put(AuthController());

  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();
  var emailController = TextEditingController();

  bool? isCheck = false;
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
            "Sign Up to $appname"
                .text
                .fontFamily(bold)
                .size(18.sp)
                .white
                .make(),
            15.h.heightBox,
            Column(
              children: [
                CustomTextField(
                    title: name,
                    hint: nameHint,
                    controller: nameController,
                    obscure: false),
                10.h.heightBox,
                CustomTextField(
                    title: email,
                    hint: emailHint,
                    controller: emailController,
                    obscure: false),
                10.h.heightBox,
                CustomTextField(
                    title: password,
                    hint: passwordHint,
                    controller: passwordController,
                    obscure: true),
                10.h.heightBox,
                CustomTextField(
                    title: retypePass,
                    hint: retypePassHint,
                    controller: passwordRetypeController,
                    obscure: true),
                10.h.heightBox,
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetPass.text.make())),
                10.h.heightBox,
                Row(
                  children: [
                    Checkbox(
                      value: isCheck,
                      onChanged: (newVal) {
                        setState(() {
                          isCheck = newVal;
                        });
                      },
                      checkColor: redColor,
                    ),
                    10.w.widthBox,
                    Expanded(
                      child: RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: "I agree to the ",
                            style: TextStyle(
                                fontFamily: regular, color: fontGrey)),
                        TextSpan(
                            text: tnc,
                            style: TextStyle(
                                fontFamily: regular, color: redColor)),
                        TextSpan(
                            text: " & ",
                            style: TextStyle(
                                fontFamily: regular, color: redColor)),
                        TextSpan(
                            text: privacyPolicy,
                            style: TextStyle(
                                fontFamily: regular, color: redColor)),
                      ])),
                    ),
                  ],
                ),
                10.h.heightBox,
                ourButton(
                    color: isCheck! ? redColor : lightGrey,
                    title: signUp,
                    textColor: whiteColor,
                    onPress: () {
                      if (passwordController.text.toString().trim() !=
                          passwordRetypeController.text.toString().trim()) {
                        VxToast.show(context, msg: "Password does not match");
                        passwordController.text = '';
                        passwordRetypeController.text = '';
                        return;
                      }
                      if (isCheck!) {
                        try {
                          controller
                              .signUpMethod(
                                  context: context,
                                  email: emailController.text.toString().trim(),
                                  password:
                                      passwordController.text.toString().trim())
                              .then((value) => {
                                    controller.storeUserData(
                                        email: emailController.text
                                            .toString()
                                            .trim(),
                                        password: passwordController.text
                                            .toString()
                                            .trim(),
                                        name: nameController.text
                                            .toString()
                                            .trim())
                                  })
                              .then((value) => {
                                    VxToast.show(context,
                                        msg: "Logged in successfully!"),
                                    Get.offAll(Home())
                                  });
                        } catch (e) {
                          auth.signOut();
                          VxToast.show(context, msg: e.toString());
                        }
                      }
                    }).box.width(context.screenWidth - 50).make(),
                10.h.heightBox,
                GestureDetector(
                  onTap: () {
                    Get.off(() => LoginScreen());
                  },
                  child: RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                        text: alreadyHaveAcc,
                        style: TextStyle(fontFamily: bold, color: fontGrey)),
                    TextSpan(
                        text: login,
                        style: TextStyle(fontFamily: bold, color: redColor)),
                  ])),
                )
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
