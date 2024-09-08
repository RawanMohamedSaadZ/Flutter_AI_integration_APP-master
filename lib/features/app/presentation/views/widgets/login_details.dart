import 'package:flutter/material.dart';

import '../../../../../core/Components/custom_button_login.dart';
import '../../../../../core/Components/custom_text.dart';
import '../../../../../core/Components/custom_text_field.dart';
import '../../../../../core/utils/styles.dart';

class LoginDetails extends StatefulWidget {
  const LoginDetails({super.key});

  @override
  State<LoginDetails> createState() => _LoginDetailsState();
}

class _LoginDetailsState extends State<LoginDetails> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding:  EdgeInsets.all(15),

                child: Divider(
                  color: Colors.white,
                  thickness: 4,
                  indent: 31,
                ),
              ),
            ),

            //Step2

            Text(
              ' Sigin with google',
              style: Styles.Style12,
            ),

            //step3
            Expanded(
              child: Padding(
                padding:  EdgeInsets.all(15),
                child: Divider(
                  color: Colors.white,
                  thickness: 4,
                  endIndent: 31,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: screenSize.height * 0.03),
        CustomText(text:'Email'),
        CustomTextField(
          hintText: 'Enter your Email',
          labelText: 'Email',
        ),
        SizedBox(
          height: 10,
        ),
        CustomText(text:'Password'),
        CustomTextField(
          hintText: 'Enter your Password',
          labelText: 'Password',
        ),
        SizedBox(height: screenSize.height * 0.01),
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Row(
            children: [
              Checkbox(
                // hold state Checked box
                value: flag,
                // invoke when user interact with checkedbox
                onChanged: (val) {
                  // Called to update data
                  //  Rebuild Widget New State
                  setState(() {
                    // update var in new val
                    flag = val!;
                  });
                },
                side: const BorderSide(color: Colors.white),
                activeColor: Colors
                    .green, // Change the color when the checkbox is checked
                checkColor:
                Colors.white, // Change the color of the checkmark
              ),

              Text(
                ' Remmeber Me',
                style:  Styles.Style15 ,
              ),

              // SizedBox(width: screenSize.width * 0.3),
              Flexible(
                  flex: 1,
                  child: Container()),

              GestureDetector(
                onTap: () {},
                child:  Padding(
                  padding:  EdgeInsets.only(right: 25),
                  child:  Text(
                    'ForgetPassword',
                    style: Styles.Style15D,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: screenSize.height * 0.03),
        CustomButtonLogin(text: 'Signin', Navigate:"/HomePage"),
        SizedBox(height: screenSize.height * 0.03),
        Text(
          "By Continuing you accepting our standards terms and conditions",
          style:  Styles.Style10D,),
        Text(
          "and our privacy policy.",
          style:  Styles.Style10,
        ),
        SizedBox(height: screenSize.height * 0.03),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don’t have an account?  ",
              style:  Styles.Style14w,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/signup");
                },
                child:  Text(
                    "Sign Up",
                    style:  Styles.Style14b
                ))
          ],
        )
      ],
    );
  }
}
