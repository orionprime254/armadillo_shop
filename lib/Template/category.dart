import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String categoryName;
  final String imagePath;
  final void Function()? onTap;

  const CategoryTile(
      {super.key,
      required this.categoryName,
      this.onTap,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
                width: 105,
                height: 50,
                decoration: BoxDecoration(
                    //color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(48),
                        ),
                        child: Image.asset(
                          imagePath,
                          height: 40,
                          width: 40,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 8, 0, 7),
                        child: Text(
                          categoryName,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        )
      ],
    );
  }
}
