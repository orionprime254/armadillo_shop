import 'package:armadillo_shop/common/widgets/app_style.dart';
import 'package:armadillo_shop/common/widgets/tab_widget.dart';
import 'package:armadillo_shop/src/home/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/kcolors.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({super.key, required TabController tabController}): _tabController= tabController;
  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22.h,
      child: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            color: Kolors.kPrimary,
            borderRadius: BorderRadius.circular(25)
          ),
          labelPadding: EdgeInsets.zero,
          labelColor: Kolors.kWhite,
          dividerColor: Colors.transparent,
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          unselectedLabelStyle:   appStyle(11, Kolors.kGray, FontWeight.normal),
          labelStyle: appStyle(11, Kolors.kPrimary, FontWeight.w600),
          tabs: List.generate(homeTabs.length, (i)=>Tab(
            child: TabWidget(
              text: homeTabs[i],
            ),
          ))),
    );
  }
}
