import 'package:armadillo_shop/Template/category.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Hello, Welcome',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Categories',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryTile(
                      categoryName: 'Laptops',
                      imagePath: 'lib/imgs/applem2.png',
                    ),
                    CategoryTile(
                        categoryName: 'Watches',
                        imagePath: 'lib/imgs/xiaomiwatch.png'),
                    CategoryTile(
                        categoryName: 'Phones',
                        imagePath: 'lib/imgs/iphone.png'),
                    CategoryTile(
                        categoryName: 'Extras',
                        imagePath: 'lib/imgs/mouse.png'),
                    CategoryTile(
                        categoryName: 'Hardware', imagePath: 'lib/imgs/cpu.jpg')
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Trending...',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ));
  }
}
