import 'package:flutter/material.dart';
import 'package:image_classification_app/features/App/presentation/views/screens/welcome_view_body.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WelcomeViewBody(),
      ),
    );
  }
}
