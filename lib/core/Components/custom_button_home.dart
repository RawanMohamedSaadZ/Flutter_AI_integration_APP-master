import 'package:flutter/material.dart';
import 'package:image_classification_app/core/utils/styles.dart';

class CustomButtonHome extends StatelessWidget {
  const CustomButtonHome({super.key, required this.text, required this.Navigate});
  final String text;
  final Widget Navigate;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
          backgroundColor: MaterialStateProperty.all(const Color(0xff6E2D8C))
      ),
      onPressed: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Navigate));
      },
      child:  Text(text, style: Styles.Style20),
    );
  }
}
