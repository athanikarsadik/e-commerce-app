import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/controllers/home_controller.dart';
import 'package:e_commerce_app/views/cart_screen/cart_screen.dart';
import 'package:e_commerce_app/views/category_screens/category_screen.dart';
import 'package:e_commerce_app/views/home_screens/home_screen.dart';
import 'package:e_commerce_app/views/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});

  var controller = Get.put(HomeController());

  var navBarItems = [
    BottomNavigationBarItem(
        icon: Image.asset(icHome, width: 26.sp), label: home),
    BottomNavigationBarItem(
        icon: Image.asset(icCategories, width: 26.sp), label: categories),
    BottomNavigationBarItem(
        icon: Image.asset(icCart, width: 26.sp), label: cart),
    BottomNavigationBarItem(
        icon: Image.asset(icProfile, width: 26.sp), label: account),
  ];

  var navBody = const [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: redColor,
          selectedLabelStyle: TextStyle(color: redColor, fontFamily: semibold),
          items: navBarItems,
          backgroundColor: whiteColor,
          onTap: (val) {
            controller.currentNavIndex.value = val;
          },
        ),
      ),
    );
  }
}
