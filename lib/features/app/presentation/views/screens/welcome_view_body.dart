import 'package:flutter/material.dart';
import 'package:image_classification_app/generated/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../widgets/welcome_details.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xff2E1847),
        width: double.infinity,
        height: double.infinity,
        child: welcome_details(),
      );
  }
}

