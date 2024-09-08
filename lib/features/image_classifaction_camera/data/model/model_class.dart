// In ModelClass.dart

import 'package:camera/camera.dart';
import 'package:tflite_v2/tflite_v2.dart';

import '../../../../generated/assets.dart';

class ModelClass {
  static bool _isModelLoaded = false;

  static Future<void> loadModel() async {
    if (!_isModelLoaded) {
      await Tflite.loadModel(
        model: Assets.ClassifyModel,
        labels: Assets.ClassifyLabel,
      );
      _isModelLoaded = true;
    }
  }

  static Future<List<Map<String, dynamic>>?> classifyStream(CameraImage cameraImage) async {
    if (!_isModelLoaded) return null;

    final result = await Tflite.runModelOnFrame(
      bytesList: cameraImage.planes.map((plane) => plane.bytes).toList(),
      imageHeight: cameraImage.height,
      imageWidth: cameraImage.width,
      numResults: 2,
      threshold: 0.7,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    if (result != null) {
      return result.cast<Map<String, dynamic>>(); // Casting to the correct type
    }

    return null;
  }

  static void closeModel() {
    Tflite.close();
    _isModelLoaded = false;
  }
}
