import 'package:armadillo_shop/common/utils/kcolors.dart';
import 'package:armadillo_shop/common/widgets/app_style.dart';
import 'package:armadillo_shop/src/cart/views/cart_screen.dart';
import 'package:armadillo_shop/src/entrypoint/controller/bottom_tab_notifier.dart';
import 'package:armadillo_shop/src/profile/views/profile_screen.dart';
import 'package:armadillo_shop/src/wishlist/views/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

import '../../home/views/home_screen.dart';

class AppEntryPoint extends StatelessWidget {
  AppEntryPoint({super.key});

  List<Widget> pageList = [
    HomePage(),
    WishListPage(),
    CartPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabIndexNotifier>(
      builder: (context,tabIndexNotifier,child){
        return Scaffold(
          body: Stack(
            children: [
              pageList[tabIndexNotifier.index],
              Align(
                alignment: Alignment.bottomCenter,
                child: Theme(
                  data: Theme.of(context).copyWith(canvasColor: Kolors.kOffWhite),
                  child: BottomNavigationBar(
                    selectedFontSize: 12,
                    elevation: 0,
                    backgroundColor: Kolors.kOffWhite,
                    selectedLabelStyle: appStyle(9, Kolors.kPrimary, FontWeight.w500),
                    showSelectedLabels: true,
                    showUnselectedLabels: false,
                    currentIndex: tabIndexNotifier.index,
                    selectedItemColor: Kolors.kPrimary,
                    unselectedItemColor: Kolors.kGray,
                    unselectedIconTheme: IconThemeData(color: Colors.black38),
                    onTap: (i){
tabIndexNotifier.setIndex(i);
                    },
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(
                            AntDesign.home,
                            color: Kolors.kPrimary,
                            size: 24,
                          ),
                          label: "Home"
                      ),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Ionicons.heart_outline,
                            color: Kolors.kPrimary,
                            size: 24,
                          ),
                          label: "Wishlist"
                      ),
                      BottomNavigationBarItem(
                          icon: Badge(
                            label: Text('9'),
                            child: Icon(
                              MaterialCommunityIcons.shopping_outline,
                              color: Kolors.kPrimary,
                              size: 24,
                            ),
                          ),
                          label: "cart"
                      ),
                      BottomNavigationBarItem(
                          icon: Icon(
                            EvilIcons.user,
                            color: Kolors.kPrimary,
                            size: 34,
                          ),
                          label: "profile"
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
