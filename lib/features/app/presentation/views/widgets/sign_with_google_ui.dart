import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';

class SignWithGoogleUI extends StatelessWidget {
  const SignWithGoogleUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // Step#2:intilize Required Properties
      onPressed: () {
        // Define what should happen when the button is pressed
        // signInWithGoogle();
      },
      child: Row(
        // Step#
        mainAxisSize: MainAxisSize.min,
        children: [
          // Step#
          Image.asset(Assets.iconsGoogle,
              height: 24.0), // Google logo
          const Padding(
            //Step#
            padding:  EdgeInsets.only(left: 10),
            child: Text('Sign in with Google',
                style: TextStyle(
                    color: Colors
                        .white)), // Optional: Change text color
          ),
        ],
      ),
      // Step#3:Optional Properties
      style: ButtonStyle(
        shape:
        MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                8), // Adjust the corner radius here
            side: const BorderSide(
                color: Colors.white,
                width:
                2), // Set the border color and width here
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all<Color>(Colors
            .transparent), // Optional: Change button color
      ),
    );
  }
}