import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:e_commerce_app/views/home_screens/components/featured_button.dart';
import 'package:e_commerce_app/widgets_common/home_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightGrey,
      width: Get.width,
      height: Get.height,
      child: SafeArea(
          child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 60.h,
            padding: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: lightGrey,
            ),
            child: TextFormField(
              
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: whiteColor,
                  hintStyle: TextStyle(color: textfieldGrey),
                  suffixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: searchAnything),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  //swiper brands
                  VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      enableInfiniteScroll: true,
                      height: 150.h,
                      itemCount: slidersList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          slidersList[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(EdgeInsets.symmetric(horizontal: 8.w))
                            .make();
                      }),

                  10.h.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        2,
                        (index) => HomeButtons(
                            height: Get.height * 0.15,
                            width: Get.width / 2.5,
                            icon: index == 0 ? icTodaysDeal : icFlashDeal,
                            title: index == 0 ? todaysDeal : flashSale)),
                  ),

                  //swiper brands
                  10.h.heightBox,
                  VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      enableInfiniteScroll: true,
                      height: 150.h,
                      itemCount: secondSlidersList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          secondSlidersList[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(EdgeInsets.symmetric(horizontal: 8.w))
                            .make();
                      }),

                  10.h.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        3,
                        (index) => HomeButtons(
                            height: Get.height * 0.15,
                            width: Get.width / 3.5,
                            icon: index == 0
                                ? icTopCategories
                                : index == 1
                                    ? icBrands
                                    : icTopSeller,
                            title: index == 0
                                ? topCategories
                                : index == 1
                                    ? brand
                                    : topSellers)),
                  ),
                  20.h.heightBox,
                  //featured categories
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: featuredCategories.text
                          .color(darkFontGrey)
                          .size(18.sp)
                          .fontFamily(semibold)
                          .make(),
                    ),
                  ),
                  20.h.heightBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          3,
                          (index) => Column(
                                children: [
                                  featuredButton(
                                      img: featuredImages1[index],
                                      title: featuredTitles1[index]),
                                  10.h.heightBox,
                                  featuredButton(
                                      img: featuredImages2[index],
                                      title: featuredTitles2[index]),
                                ],
                              )).toList(),
                    ),
                  ),
                  //featured Products
                  20.h.heightBox,
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10.w),
                    decoration: const BoxDecoration(color: redColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        featuredProduct.text.white
                            .fontFamily(bold)
                            .size(18.sp)
                            .make(),
                        10.h.heightBox,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                6,
                                (index) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          imgB1,
                                          width: 150.w,
                                          fit: BoxFit.cover,
                                        ),
                                        10.h.heightBox,
                                        "Laptop 4GB/64GB"
                                            .text
                                            .fontFamily(semibold)
                                            .color(darkFontGrey)
                                            .make(),
                                        10.h.heightBox,
                                        "\$600"
                                            .text
                                            .color(redColor)
                                            .fontFamily(bold)
                                            .size(16)
                                            .make()
                                      ],
                                    )
                                        .box
                                        .margin(EdgeInsets.symmetric(
                                            horizontal: 4.w))
                                        .white
                                        .roundedSM
                                        .padding(const EdgeInsets.all(10))
                                        .make()),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //third brands
                  20.h.heightBox,
                  VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      enableInfiniteScroll: true,
                      height: 150.h,
                      itemCount: secondSlidersList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          secondSlidersList[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(EdgeInsets.symmetric(horizontal: 8.w))
                            .make();
                      }),

                  20.h.heightBox,
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          mainAxisExtent: 300,
                          crossAxisSpacing: 8),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              imgP5,
                              width: 200.w,
                              height: 200.h,
                              fit: BoxFit.cover,
                            ),
                            const Spacer(),
                            "Laptop 4GB/64GB"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                            10.h.heightBox,
                            "\$600"
                                .text
                                .color(redColor)
                                .fontFamily(bold)
                                .size(16)
                                .make()
                          ],
                        )
                            .box
                            .margin(EdgeInsets.symmetric(horizontal: 4.w))
                            .white
                            .roundedSM
                            .padding(EdgeInsets.all(12.w))
                            .make();
                      })
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
