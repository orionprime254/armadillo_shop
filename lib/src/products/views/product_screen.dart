import 'package:armadillo_shop/common/services/storage.dart';
import 'package:armadillo_shop/common/utils/kcolors.dart';
import 'package:armadillo_shop/common/widgets/app_style.dart';
import 'package:armadillo_shop/common/widgets/back_button.dart';
import 'package:armadillo_shop/common/widgets/error_modal.dart';
import 'package:armadillo_shop/common/widgets/login_bottom_sheet.dart';
import 'package:armadillo_shop/common/widgets/reusable_text.dart';
import 'package:armadillo_shop/src/products/controllers/product_nottifier.dart';
import 'package:armadillo_shop/src/products/controllers/ram_storage_notifiers.dart';
import 'package:armadillo_shop/src/products/widgets/expandable_text.dart';
import 'package:armadillo_shop/src/products/widgets/product_bottom_bar.dart';
import 'package:armadillo_shop/src/products/widgets/product_sizes_widget.dart';
import 'package:armadillo_shop/src/products/widgets/similar_products.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

import '../../../const/constants.dart';
import '../widgets/storage_selection.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    String? accessToken = Storage().getString('accessToken');
    return Consumer<ProductNotifier>(
      builder: (context, productNotifier, child) {
        return Scaffold(
          //appBar: AppBar(),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Kolors.kWhite,
                expandedHeight: 320.h,
                collapsedHeight: 65.h,
                floating: false,
                pinned: true,
                leading: AppBackButton(),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundColor: Kolors.kSecondaryLight,
                        child: Icon(
                          AntDesign.heart,
                          color: Kolors.kRed,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  background: SizedBox(
                    height: 415.h,
                    child: ImageSlideshow(
                      indicatorColor: Kolors.kPrimaryLight,
                      //onPageChanged: (p) {},
                      autoPlayInterval: 15000,
                      isLoop: productNotifier.product!.imageUrls.length > 1
                          ? true
                          : false,
                      children: List.generate(
                          productNotifier.product!.imageUrls.length,
                          (i) => CachedNetworkImage(
                                placeholder: placeholder,
                                errorWidget: errorWidget,
                                height: 415.h,
                                imageUrl: productNotifier.product!.imageUrls[i],
                                fit: BoxFit.cover,
                              )),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.h,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                          text: productNotifier.product!.clothesType
                              .toUpperCase(),
                          style: appStyle(13, Kolors.kGray, FontWeight.w600)),
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
                              text: productNotifier.product!.ratings
                                  .toStringAsFixed(1),
                              style: appStyle(
                                  13, Kolors.kGray, FontWeight.normal)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.h,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ReusableText(
                    text: productNotifier.product!.title,
                    style: appStyle(16, Kolors.kDark, FontWeight.w600),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(8.h),
                  child: ExpandableText(
                      text: productNotifier.product!.description),
                ),
                //
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Divider(
                  thickness: .5.h,
                ),
              )),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.h,
                ),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ReusableText(
                    text: "Select Size",
                    style: appStyle(16, Kolors.kDark, FontWeight.w600)),
              )),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.h,
                ),
              ),
              SliverToBoxAdapter(child: StorageSelectionWidget()),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.h,
                ),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ReusableText(
                    text: "Select Ram",
                    style: appStyle(16, Kolors.kDark, FontWeight.w600)),
              )),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.h,
                ),
              ),
              SliverToBoxAdapter(child: ProductSizesWidget()),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.h,
                ),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ReusableText(
                    text: "Similar Products",
                    style: appStyle(16, Kolors.kDark, FontWeight.w600)),
              )),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.h,
                ),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SimilarProducts(),
              )),
            ],
          ),
          bottomNavigationBar: ProductBottomBar(
            onPressed: () {
              if (accessToken == null) {
                loginBottomSheet(context);
              } else {
                if (context.read<RamStorageNotifier>().ram == '' ||
                    context.read<RamStorageNotifier>().storage == "") {
                  showErrorPopup(
                      context,
                      "Please select ram and storage to proceed",
                      "Error Adding to Cart",
                      true);
                } else {
                  //TODO cart logic
                }
              }
            },
            price: productNotifier.product!.price.toStringAsFixed(2),
          ),
        );
      },
    );
  }
}
