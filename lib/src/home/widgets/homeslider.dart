import 'package:armadillo_shop/common/utils/kcolors.dart';
import 'package:armadillo_shop/common/utils/kstrings.dart';
import 'package:armadillo_shop/common/widgets/app_style.dart';
import 'package:armadillo_shop/common/widgets/custom_button.dart';
import 'package:armadillo_shop/common/widgets/reusable_text.dart';
import 'package:armadillo_shop/const/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: kRadiusAll,
      child: Stack(
        children: [
          SizedBox(
            height: ScreenUtil().screenHeight * 0.16,
            width: ScreenUtil().screenWidth,
            child: ImageSlideshow(
              indicatorColor: Kolors.kPrimaryLight,
              onPageChanged: (p) {},
              autoPlayInterval: 5000,
              isLoop: true,
              children: List.generate(
                  images.length,
                  (i) => CachedNetworkImage(
                        placeholder: placeholder,
                        errorWidget: errorWidget,
                        imageUrl: images[i],
                        fit: BoxFit.cover,
                      )),
            ),
          ),
          Positioned(
              child: SizedBox(
            height: ScreenUtil().screenHeight * 0.16,
            width: ScreenUtil().screenWidth,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    text: AppText.kCollection,
                    style: appStyle(20, Kolors.kDark, FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Discount 20% off \nthe first transaction",
                    style: appStyle(
                        14, Kolors.kDark.withOpacity(.6), FontWeight.normal),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GradientBtn(text: "Shop Now",btnWidth: 150.w,),

                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

List<String> images = [
  "https://unsplash.com/photos/a-laptop-computer-sitting-on-top-of-a-desk-737K1r6xom0",
  "https://unsplash.com/photos/a-laptop-computer-sitting-on-top-of-a-desk-737K1r6xom0",
  "https://unsplash.com/photos/a-laptop-computer-sitting-on-top-of-a-desk-737K1r6xom0",
  "https://unsplash.com/photos/a-laptop-computer-sitting-on-top-of-a-desk-737K1r6xom0",
];
