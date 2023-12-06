import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 873),
        builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: appname,
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.transparent,
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.transparent,
                    iconTheme: IconThemeData(color: darkFontGrey)),
                fontFamily: regular),
            home: SplashScreen(),
          );
        });
  }
}
