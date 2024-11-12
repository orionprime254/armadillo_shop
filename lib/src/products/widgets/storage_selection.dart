import 'package:armadillo_shop/common/widgets/reusable_text.dart';
import 'package:armadillo_shop/const/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../common/utils/kcolors.dart';
import '../../../common/widgets/app_style.dart';
import '../controllers/product_nottifier.dart';
import '../controllers/ram_storage_notifiers.dart';
class StorageSelectionWidget extends StatelessWidget {
  const StorageSelectionWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<RamStorageNotifier>(builder: (context,controller,child){
      return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(context.read<ProductNotifier>().product!.colors.length, (i){
          String c = context.read<ProductNotifier>().product!.colors[i];
          return GestureDetector(
            onTap: (){
              controller.setstorage(c);
            },
            child: Container(
              padding: EdgeInsets.only(right: 20.w,left: 20.w),
              margin: EdgeInsets.only(right: 20.w),
              decoration: BoxDecoration(borderRadius: kRadiusAll,color: c== controller.storage?Kolors.kPrimary:Kolors.kGrayLight,),
              child: ReusableText(text: c, style: appStyle(12, Kolors.kWhite, FontWeight.normal)),
            ),
          );
        }),
      );
    });
  }
}
