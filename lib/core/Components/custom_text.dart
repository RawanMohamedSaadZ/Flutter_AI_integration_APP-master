import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25),
      alignment: Alignment.topLeft,
      child:  Text(
          text,
          textAlign: TextAlign.end,
          style: Styles.Style18W
      ),
    );
  }
}
