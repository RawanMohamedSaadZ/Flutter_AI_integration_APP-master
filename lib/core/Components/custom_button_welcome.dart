import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomButtonWelcome extends StatelessWidget {
  const CustomButtonWelcome({super.key, required this.text, required this.Navigate});

  final String text,Navigate;

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, Navigate);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 99, vertical: 15)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(66))),
      ),
      child:   Text(
        text,
        style: Styles.Styles24,
      ),
    );
  }
}
