import 'package:armadillo_shop/common/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/utils/kcolors.dart';
import '../../../const/resource.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    _navigator();
    super.initState();
  }

  _navigator() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {
      if(Storage().getBool('firstOpen')==null){
        //go to onboarding screen
        GoRouter.of(context).go('/onboarding');
      }else{
        //go to homepage
        GoRouter.of(context).go('/home');
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(R.ASSETS_IMAGES_SPLASHSCREEN_PNG))),
      ),
    );
  }
}
