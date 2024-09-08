import 'package:flutter/material.dart';
import 'package:image_classification_app/core/Components/custom_button_login.dart';
import 'package:image_classification_app/core/Components/custom_text_field.dart';
import 'package:image_classification_app/core/utils/styles.dart';

class SignUPViewBody extends StatelessWidget {
  const SignUPViewBody({
    super.key,
    required this.screenSize,
  });
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff6E2D8C),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(
                height: screenSize.height*0.05,
              ),
              Row(
                children: [

                  Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white,size: 18,),
                      onPressed: () {
                        // Handle back button press
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(width :screenSize.width *0.1), // Add some space between the back button and text

                   Text(
                    "Create an Account",
                    style: Styles.StyleBold24 ,
                  ),
                ],
              ),
              SizedBox(height :screenSize.height *0.03), // Add some space between the back button and text

               Text(
                "OR",
                style:Styles.Style16,),


              SizedBox(height :screenSize.height *0.04), // Add some space between the back button and text


            ]),
      ),
    );
  }
}
