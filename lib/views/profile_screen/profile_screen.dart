import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:e_commerce_app/views/auth_screens/login_screen.dart';
import 'package:e_commerce_app/views/profile_screen/components/details_card.dart';
import 'package:e_commerce_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgWidget(
        child: Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //edit profile button

            Padding(
              padding: EdgeInsets.only(right: 10.w,top: 5.h),
              child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.edit,
                    color: whiteColor,
                  )),
            ),

            //users details section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Image.asset(
                    imgProfile2,
                    width: 100.w,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.w.widthBox,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "User name".text.fontFamily(semibold).white.make(),
                      "user@gmail.com".text.white.make(),
                    ],
                  )),
                  OutlinedButton(
                      onPressed: () {
                        Get.put(AuthController()).signOutMethod(context: context);
                        VxToast.show(context,
                                        msg: "Logged out successfully");
                        Get.offAll(LoginScreen());
                      },
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: whiteColor)),
                      child: "Logout".text.fontFamily(semibold).white.make())
                ],
              ),
            ),

            10.h.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                detailsCard(cnt: "00", title: "In your cart", width: 115.0.w),
                detailsCard(
                    cnt: "22", title: "In your wishlist", width: 115.0.w),
                detailsCard(cnt: "21", title: "Your orders", width: 115.0.w),
              ],
            ),

            //buttons section
            ListView.separated(
                    shrinkWrap: true,
                    itemCount: profileButtonList.length,
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: lightGrey,
                      );
                    },
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.asset(
                          profileButtonIcons[index],
                          width: 22.w,
                        ),
                        title: profileButtonList[index]
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                      );
                    })
                .box
                .white
                .rounded
                .margin(EdgeInsets.all(12.w))
                .padding(EdgeInsets.symmetric(horizontal: 16.w))
                .shadowSm
                .make()
                .box
                .color(redColor)
                .make()
          ],
        ),
      ),
    ));
  }
}
