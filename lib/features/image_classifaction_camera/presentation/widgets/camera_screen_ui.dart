import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/styles.dart';
import '../controllers/camera_controller.dart';

class CamerScreenUI extends StatefulWidget {
  const CamerScreenUI({super.key});

  @override
  State<CamerScreenUI> createState() => _CamerScreenUIState();
}

class _CamerScreenUIState extends State<CamerScreenUI> {
  CameraViewController? _controller;

  String _answer = "Detecting...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.greyW,
        onPressed: () {
          setState(() {
            _controller!.toggleCameraPreview();
          });
        },
        child: Icon(
          _controller!.isPreviewPaused ? Icons.play_arrow : Icons.pause,
          color: Colors.white,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.deepPurple,
        child: Stack(
          children: [
            Positioned(
              child: Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: AspectRatio(
                    aspectRatio: _controller!.cameraAspectRatio,
                    child: CameraPreview(
                      _controller!.cameraController!,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  color: Colors.black87,
                  child: Center(
                    child: Text(
                      "Classify animal:\n$_answer",
                      textAlign: TextAlign.center,
                      style: Styles.Style22,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
