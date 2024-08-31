import 'package:flutter/material.dart';
class DisplayProduct extends StatefulWidget {
  const DisplayProduct({super.key});

  @override
  State<DisplayProduct> createState() => _DisplayProductState();
}

class _DisplayProductState extends State<DisplayProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.secondary,
            boxShadow: [BoxShadow(
              color: Color(0x80000000),
              blurRadius: 2.5
            )]

          ),
        )
      ],
    );
  }
}
