import 'package:armadillo_shop/common/services/storage.dart';
import 'package:armadillo_shop/common/utils/app_routes.dart';
import 'package:armadillo_shop/common/utils/kcolors.dart';
import 'package:armadillo_shop/common/widgets/app_style.dart';
import 'package:armadillo_shop/common/widgets/custom_button.dart';
import 'package:armadillo_shop/common/widgets/help_bottom_sheet.dart';
import 'package:armadillo_shop/common/widgets/reusable_text.dart';
import 'package:armadillo_shop/src/auth/views/login_screen.dart';
import 'package:armadillo_shop/src/profile/widgets/tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    String? accessToken = Storage().getString('accessToken');
    if(accessToken==null){
      return LoginScreen();
    }
    return Scaffold(
      body:ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 30.h,),
              CircleAvatar(
                radius: 35,
                backgroundColor: Kolors.kOffWhite,
                backgroundImage: NetworkImage("https://www.google.com/imgres?q=armadillo%20cartoon%20image&imgurl=https%3A%2F%2Fi.pinimg.com%2F474x%2F8a%2F01%2F85%2F8a01850305608f7b354c9db1cde3ce3e.jpg&imgrefurl=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F82120393200156487%2F&docid=cuI-U04JaUNq-M&tbnid=oPUBjZL-naavIM&vet=12ahUKEwjjpoy6jbaJAxVj2gIHHUWmLRoQM3oECHIQAA..i&w=282&h=400&hcb=2&ved=2ahUKEwjjpoy6jbaJAxVj2gIHHUWmLRoQM3oECHIQAA"),
                
              ),
              SizedBox(height: 15.h,),
              ReusableText(text: "armadillo@gmail.com", style: appStyle(11, Kolors.kGray, FontWeight.normal)),
            SizedBox(height: 7.h,),
            Container(
              decoration: BoxDecoration(
                color: Kolors.kOffWhite,
                borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ReusableText(text: "Armadillo", style: appStyle(14, Kolors.kDark, FontWeight.w600)),
            )
            ],
          ),
          SizedBox(height: 30.h,),
          Container(
            color: Kolors.kOffWhite,
            child: Column(
              children: [
                ProfileTileWidget(title: "My Orders", leading: Octicons.checklist,onTap: (){
                  context.push("/orders");
                },),
                ProfileTileWidget(title: "Shipping Address", leading: MaterialIcons.location_pin,onTap: (){context.push("/addresses");},),
                ProfileTileWidget(title: "Privacy Policy", leading: MaterialIcons.policy,onTap: (){context.push("/policy");},),
                ProfileTileWidget(title: "Help Center", leading: AntDesign.customerservice,onTap: ()=>showHelpCenterBottomSheet(context),),

              ],
            ),
          ),
          SizedBox(height: 30.h,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: GradientBtn(text: "Logout".toUpperCase(),btnColor:Kolors.kRed ,btnHieght: 35,btnWidth: ScreenUtil().screenWidth,),
          )
        ],
      )
    );
  }
}
