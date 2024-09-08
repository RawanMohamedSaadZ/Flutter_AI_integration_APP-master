import 'package:flutter/material.dart';
import 'package:image_classification_app/core/utils/styles.dart';
import 'package:image_classification_app/generated/assets.dart';
import '../widgets/login_details.dart';
import '../widgets/sign_with_google_ui.dart';

class LoginViewBody extends StatefulWidget {
   LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      color: const Color(0xff6E2D8C),
      height: screenSize.height,
      width: screenSize.width ,
      child: SingleChildScrollView(

        child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Step2
                  ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Image.asset(
                      Assets.login,
                      // to  ignore any problem to width height
                      fit: BoxFit.cover,
                      height: 85,
                      width: 78,
                    ),
                  ),
                  //Step3
                   Text(
                    "Login",
                    style: Styles.StyleBold24,
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.01),
               Text(
                "Security access detect me here!",
                style: Styles.Style18,
              ),
              SizedBox(height: screenSize.height * 0.03),
              SizedBox(
                width: 313, // Set the width here
                height: 43, // Set the height here
                child: SignWithGoogleUI(),
              ),
              LoginDetails()
            ]),
      ),
    );
  }
}


