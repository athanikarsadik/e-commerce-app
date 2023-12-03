import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/views/auth_screens/login_screen.dart';
import 'package:e_commerce_app/widgets_common/applogo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  changeScreen(){
    Future.delayed(const Duration(seconds: 3),(){
      Get.to(()=> const LoginScreen());
    });
  }

  @override
  void initState(){
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(child: Column(children: [
        Align(alignment: Alignment.topLeft,child: Image.asset(icSplashBg,width: 300.w,)),
        20.h.heightBox,
        appLogoWidget(),
        10.h.heightBox,
        appname.text.fontFamily(bold).size(22.sp).white.make(),
        5.h.heightBox,
        appversion.text.white.make(),
        const Spacer(),
        credits.text.white.fontFamily(semibold).make(),
        30.h.heightBox

      ],),),
    );
  }
}