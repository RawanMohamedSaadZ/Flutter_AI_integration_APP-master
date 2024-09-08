import 'package:flutter/material.dart';
import 'package:image_classification_app/features/App/presentation/views/screens/sign_up_view_body.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
          body: SignUPViewBody(screenSize: screenSize),
        ));
  }
}

