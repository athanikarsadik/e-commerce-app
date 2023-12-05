import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:e_commerce_app/widgets_common/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDetails extends StatelessWidget {
  final String title;
  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: title.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(8.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 350.h,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imgFc5,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        );
                      }),
                  10.h.heightBox,
                  //title
                  title.text
                      .size(16.sp)
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .make(),

                  //rating
                  VxRating(
                    onRatingUpdate: (val) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    // maxRating: 5,
                    value: 5,
                    size: 25.sp,
                    stepInt: true,
                    count: 5,
                  ),

                  10.h.heightBox,
                  "\$30,000".text.color(redColor).fontFamily(bold).make(),

                  10.h.heightBox,

                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          "Seller".text.fontFamily(semibold).make(),
                          5.h.heightBox,
                          "In house brands"
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .size(16.sp)
                              .make()
                        ],
                      )),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.message_rounded,
                          color: darkFontGrey,
                        ),
                      )
                    ],
                  )
                      .box
                      .height(60.h)
                      .padding(EdgeInsets.symmetric(horizontal: 16.w))
                      .color(textfieldGrey)
                      .roundedSM
                      .make(),

                  20.h.heightBox,
                  //color selection
                  Column(
                    children: [
                      //color row
                      Row(
                        children: [
                          SizedBox(
                            width: 100.w,
                            child: "Color: ".text.color(textfieldGrey).make(),
                          ),
                          Row(
                            children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(40.w, 40.h)
                                    .roundedFull
                                    .color(Vx.randomPrimaryColor)
                                    .margin(EdgeInsetsDirectional.symmetric(
                                        horizontal: 4.w))
                                    .make()),
                          )
                        ],
                      ).box.padding(EdgeInsets.all(8.h)).make(),
                      //Quantity Row
                      Row(
                        children: [
                          SizedBox(
                            width: 100.w,
                            child:
                                "Quantity: ".text.color(textfieldGrey).make(),
                          ),
                          Row(children: [
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.remove_circle)),
                            "0"
                                .text
                                .size(16.sp)
                                .color(darkFontGrey)
                                .fontFamily(bold)
                                .make(),
                            IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle)),
                            10.w.widthBox,
                            "0 available".text.color(darkFontGrey).make()
                          ]),
                        ],
                      ).box.padding(EdgeInsets.all(8.h)).make(),

                      //total row
                      Row(
                        children: [
                          SizedBox(
                            width: 100.w,
                            child: "Total: ".text.color(textfieldGrey).make(),
                          ),
                          "\$0.00"
                              .text
                              .color(redColor)
                              .size(16.sp)
                              .fontFamily(bold)
                              .make()
                        ],
                      ).box.padding(EdgeInsets.all(8.h)).make(),
                      10.h.heightBox
                    ],
                  ).box.white.roundedSM.shadowSm.make(),

                  10.h.heightBox,
                  //description section
                  "Description"
                      .text
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .make(),

                  10.h.heightBox,
                  "This is a dummy item descriptiom"
                      .text
                      .wrapWords(true)
                      .color(darkFontGrey)
                      .make(),

                  //buttons section
                  10.h.heightBox,
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                        itemDetailsButtonList.length,
                        (index) => ListTile(
                              title: itemDetailsButtonList[index]
                                  .text
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .make(),
                              trailing: const Icon(Icons.arrow_forward_rounded),
                            )),
                  ),

                  //product may like section
                  20.h.heightBox,
                  productLikes.text
                      .fontFamily(bold)
                      .size(16.sp)
                      .color(darkFontGrey)
                      .make(),
                  10.h.heightBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          6,
                          (index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  .margin(EdgeInsets.symmetric(horizontal: 4.w))
                                  .white
                                  .roundedSM
                                  .padding(const EdgeInsets.all(10))
                                  .make()),
                    ),
                  ),
                ],
              ),
            ),
          )),
          SizedBox(
            width: double.infinity,
            height: 60.h,
            child: ourButton(
                color: redColor,
                onPress: () {},
                textColor: whiteColor,
                title: "Add to Cart"),
          ),
          15.h.heightBox
        ],
      ),
    );
  }
}
