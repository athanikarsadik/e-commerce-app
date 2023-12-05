import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/views/category_screens/item_details.dart';
import 'package:e_commerce_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CategoryDetails extends StatelessWidget {
  String? title;
  CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: title!.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(
                      6,
                      (index) => "Baby Clothing"
                          .text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .size(12.sp)
                          .makeCentered()
                          .box
                          .white
                          .rounded
                          .size(120.w, 60.h)
                          .margin(EdgeInsets.symmetric(horizontal: 4.w))
                          .make()),
                )),
            20.h.heightBox,
            //items
            Expanded(
                child: Container(
              color: lightGrey,
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  physics: const ClampingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 8.h,
                      crossAxisSpacing: 8.w,
                      mainAxisExtent: 250,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          imgP5,
                          width: 200.w,
                          height: 150.h,
                          fit: BoxFit.cover,
                        ),
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
                        .make().onTap(() {Get.to(()=> const ItemDetails(title: "Dummy"));});
                  }),
            ))
          ],
        ),
      ),
    ));
  }
}
