import 'package:flutter/material.dart';
import '../../../../../core/Components/custom_button_welcome.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../generated/assets.dart';

class welcome_details extends StatelessWidget {
  const welcome_details({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(
          height: 100,
        ),
        Text("Object Detection app ",
            style: Styles.StyleBold26 ),
         SizedBox(
          height: 22,
        ),

        ClipRRect(
            borderRadius: BorderRadius.circular(66),
            child: Image.asset(Assets.Welcome, width: 224 ,
              height:238 , fit: BoxFit.cover,
            )),
         SizedBox(
          height: 22,
        ),
        CustomButtonWelcome(
          text: 'Log in',
          Navigate:  "/LoginForm",
        ),

        const SizedBox(
          height: 22,
        ),
        CustomButtonWelcome(
          text: "Sign up",
          Navigate:  '/signup',
        ),

      ],
    );
  }
}
