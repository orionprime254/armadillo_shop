import 'package:armadillo_shop/common/services/storage.dart';
import 'package:armadillo_shop/common/utils/app_routes.dart';
import 'package:armadillo_shop/common/utils/kcolors.dart';
import 'package:armadillo_shop/common/widgets/app_style.dart';
import 'package:armadillo_shop/common/widgets/logout_bottom_sheet.dart';
import 'package:armadillo_shop/common/widgets/reusable_text.dart';
import 'package:armadillo_shop/src/products/controllers/product_nottifier.dart';
import 'package:armadillo_shop/src/products/models/products_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StaggeredTileWidget extends StatelessWidget {
  const StaggeredTileWidget(
      {super.key, required this.i, required this.product, this.onTap});

  final int i;
  final Products product;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // String? accesstoken = Storage().getString('accessToken');
    return GestureDetector(
      onTap: () {
        context.read<ProductNotifier>().setProduct(product);
        context.push('/product/${product.id}');
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Kolors.kOffWhite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: i % 2 == 0 ? 163.h : 180.h,
                color: Kolors.kPrimary,
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: product.imageUrls[0],
                      height: i % 2 == 0 ? 163.h : 180.h,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      right: 10.h,
                      top: 10.h,
                      child: GestureDetector(
                        onTap: onTap,
                        child: CircleAvatar(
                          backgroundColor: Kolors.kSecondaryLight,
                          child: Icon(
                            AntDesign.heart,
                            color: Kolors.kRed,
                            size: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        product.title,
                        overflow: TextOverflow.ellipsis,
                        style: appStyle(13, Kolors.kDark, FontWeight.w600),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          AntDesign.star,
                          color: Kolors.kGold,
                          size: 14,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        ReusableText(
                            text: product.ratings.toStringAsFixed(1),
                            style:
                                appStyle(13, Kolors.kGray, FontWeight.normal))
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: ReusableText(
                    text: 'Ksh ${product.price.toStringAsFixed(2)}',
                    style: appStyle(17, Kolors.kDark, FontWeight.w500)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
