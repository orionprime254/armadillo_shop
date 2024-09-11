import 'package:armadillo_shop/common/utils/environment.dart';
import 'package:armadillo_shop/pages/HomePage.dart';
import 'package:armadillo_shop/pages/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  //load the correct environment
 await dotenv.load(fileName: Environment.fileName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme
        ),


      ),
      home: const BottomNavBar(),
    );
  }
}



