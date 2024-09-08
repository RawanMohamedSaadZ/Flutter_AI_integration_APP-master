// features/image_classification/presentation/pages/camera_screen.dart

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_classification_app/core/constants/app_colors.dart';
import 'package:image_classification_app/core/utils/styles.dart';
import '../controllers/camera_controller.dart';
import '../widgets/camera_screen_ui.dart'; // Use the controller

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  CameraViewController? _controller;
  String _answer = "Detecting...";

  @override
  void initState() {
    super.initState();
    _controller = CameraViewController();
    _controller!.initializeCamera().then((_) {
      setState(() {
        _answer = _controller!.answer;
      });
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller!.isModelLoaded || !_controller!.isCameraInitialized) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFFA7BAE0)),
      );
    } else {
      return SafeArea(
        child: CamerScreenUI(),
      );
    }
  }
}

