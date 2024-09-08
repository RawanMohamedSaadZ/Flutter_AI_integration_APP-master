import 'package:flutter/material.dart';

import '../../../../../core/Components/custom_button_login.dart';
import '../../../../../core/Components/custom_text_field.dart';
import '../../../../../core/utils/styles.dart';

class SignupDetails extends StatelessWidget {
  const SignupDetails({super.key, required this.screenSize});
  final Size screenSize;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(hintText: 'Enter your Email', labelText: 'Email'),
        CustomTextField(hintText: 'Enter your password', labelText: 'Password'),
        CustomTextField(hintText: 'Confirm password', labelText: 'Confirm Password'),



        SizedBox(height :screenSize.height *0.1), // Add some space between the back button and text


        CustomButtonLogin(text: "Create Account", Navigate:"/LoginForm"),

        SizedBox(height :screenSize.height *0.03), // Add some space between the back button and text

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account?  ",
              style: Styles.Style14w,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/LoginForm");
              },
              child:  Text(
                  "Login",
                  style:Styles.Style14b),
            )
          ],
        ),

      ],
    );
  }
}
