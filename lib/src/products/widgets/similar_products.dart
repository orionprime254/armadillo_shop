import 'package:armadillo_shop/src/products/widgets/staggered_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../common/services/storage.dart';
import '../../../common/widgets/login_bottom_sheet.dart';
import '../../../const/constants.dart';
class SimilarProducts extends StatelessWidget {
  const SimilarProducts({super.key});

  @override
  Widget build(BuildContext context) {
    String? accesstoken = Storage().getString('accessToken');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: List.generate(products.length, (i) {
          final product = products[i];
          final double mainAxisCellCount = (i % 2 == 0 ? 2.17 : 2.4);
          return StaggeredGridTile.count(
            mainAxisCellCount: mainAxisCellCount,
            crossAxisCellCount: 2,
            child: StaggeredTileWidget(
                onTap: () {
                  if (accesstoken == null) {
                    loginBottomSheet(context);
                  } else {
                    //handle wishlistfunctionality
                  }
                },
                i: i,
                product: product),
          );
        }),
      ),
    );
  }
}
