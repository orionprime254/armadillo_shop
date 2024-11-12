import 'package:armadillo_shop/common/utils/environment.dart';
import 'package:armadillo_shop/common/utils/kstrings.dart';
import 'package:armadillo_shop/src/auth/controllers/auth_notifier.dart';
import 'package:armadillo_shop/src/auth/controllers/password_notifier.dart';
import 'package:armadillo_shop/src/categories/controllers/category_notifier.dart';
import 'package:armadillo_shop/src/entrypoint/controller/bottom_tab_notifier.dart';
import 'package:armadillo_shop/src/home/conrtrollers/home_tab_notifier.dart';

import 'package:armadillo_shop/src/onboarding/views/controller/onboarding_notifier.dart';
import 'package:armadillo_shop/src/products/controllers/product_nottifier.dart';
import 'package:armadillo_shop/src/products/controllers/ram_storage_notifiers.dart';
import 'package:armadillo_shop/src/splashscreen/views/splashscren_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'common/utils/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //load the correct environment
  await dotenv.load(fileName: Environment.fileName);
  await GetStorage.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => OnboardingNotifier(),
      ),
      ChangeNotifierProvider(
        create: (_) => AuthNotifier(),
      ),
      ChangeNotifierProvider(
        create: (_) =>TabIndexNotifier(),
      ),
      ChangeNotifierProvider(
        create: (_) =>CategoryNotifier(),
      ),
      ChangeNotifierProvider(
        create: (_) =>HomeTabNotifier(),
      ),
      ChangeNotifierProvider(
        create: (_) =>ProductNotifier(),
      ),
      ChangeNotifierProvider(
        create: (_) =>RamStorageNotifier(),
      ),
      ChangeNotifierProvider(
        create: (_) => PasswordNotifier(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: screenSize,
      minTextAdapt: true,
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppText.kAppName,
          theme: ThemeData(
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          ),
          routerConfig: router,
        );
      },
      child: const SplashScreen(),
    );
  }
}
