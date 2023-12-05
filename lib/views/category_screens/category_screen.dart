import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:e_commerce_app/views/category_screens/category_details.dart';
import 'package:e_commerce_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: categories.text.white.fontFamily(bold).make(),
      ),
      body: Container(
        padding: EdgeInsets.all(12.w),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.w,
                crossAxisSpacing: 8.w,
                mainAxisExtent: 200),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(
                    categoriesImages[index],
                    height: 120.h,
                    width: 200.w,
                    fit: BoxFit.cover,
                  ),
                  10.h.heightBox,
                  categoriesList[index]
                      .text
                      .color(darkFontGrey)
                      .align(TextAlign.center)
                      .make()
                ],
              ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(() {
                Get.to(()=> CategoryDetails(title: categoriesList[index]));
              });
            }),
      ),
    ));
  }
}
