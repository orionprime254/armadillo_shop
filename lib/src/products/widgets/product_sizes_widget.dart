import 'package:armadillo_shop/common/utils/kcolors.dart';
import 'package:armadillo_shop/common/widgets/app_style.dart';
import 'package:armadillo_shop/src/products/controllers/product_nottifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../controllers/ram_storage_notifiers.dart';
class ProductSizesWidget extends StatelessWidget {
  const ProductSizesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RamStorageNotifier>(builder: (context,controller,child){
      return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(context.read<ProductNotifier>().product!.sizes.length, (i){
          String r = context.read<ProductNotifier>().product!.sizes[i];
          return GestureDetector(
            onTap: (){
              controller.setRam(r);
            },
            child: Container(
              height:30.h,
              width: 45.h,
              decoration: BoxDecoration(
                color: controller.ram ==r? Kolors.kPrimaryLight:Kolors.kGrayLight,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Center(
                child: Text(r,style: appStyle(20, Kolors.kWhite, FontWeight.bold),),
              ),
            ),
          );
        }),
      );
    });
  }
}
