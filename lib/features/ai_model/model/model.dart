import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:image_classification_app/generated/assets.dart';
import 'package:tflite_v2/tflite_v2.dart';
class ModelClass {

  static bool _isModelLoaded = false;
  static int _lastProcessedTime = DateTime.now().millisecondsSinceEpoch;
  static bool get isModelLoaded => _isModelLoaded;

  static Future<void> loadModel() async {
    try {
      await Tflite.loadModel(
        model: Assets.ClassifyModel,
        labels: Assets.ClassifyLabel,
      );
      _isModelLoaded = true;
      print("Model loaded successfully");
    } catch (e) {
      print("Failed to load model: $e *******************************");
    }
  }

  static Future<String> classifyImage(String imagePath) async {
    await loadModel();

    var output = await Tflite.runModelOnImage(
      path: imagePath,
      numResults: 2, // Assuming you want the top 2 results
      threshold: 0.7, // Minimum confidence threshold for including a result
      imageMean: 127.5, // These values depend on your model
      imageStd: 127.5, // These values depend on your model
    );
    if (output != null && output.isNotEmpty) {
      // Assuming the output is a list of recognitions
      final recognition = output.first;
      final label = recognition['label'];
      final confidence = recognition['confidence'];
      return '$label - ${(confidence * 100).toStringAsFixed(0)}%';
    } else {
      return 'Classification failed';
    }
  }

  static Future<List?> classifyStream(CameraImage cameraImage) async {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    if (currentTime - _lastProcessedTime < 1000) { // 1000 ms = 1 second
      return null;
    }
    _lastProcessedTime = currentTime;
    try {
      var result = await Tflite.runModelOnFrame(
        bytesList: cameraImage.planes.map((plane) => plane.bytes).toList(),
        imageHeight: cameraImage.height,
        imageWidth: cameraImage.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 3,
        threshold: 0.1,
        asynch: true,
      );
      print("result  : $result");
      return result;
    } catch (e) {
      print("Error during model inference: $e");
      return null;
    }
  }

  static Future<void> closeModel() async {

    await Tflite.close();

    _isModelLoaded = false;
  }

  ///////////////////// YOLO

  static Future<void> loadYOLOModel() async {
    try {
      await Tflite.loadModel(
        model: Assets.yolov2Model,
        labels: Assets.yolov2Label,
      );
      _isModelLoaded = true;
      print("YOLO Model loaded successfully");
    } catch (e) {
      print("Failed to load YOLO model: $e *******************************");
    }
  }

  static Future<List?> ImageDetection(CameraImage image) async {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    if (currentTime - _lastProcessedTime < 1000) { // 1000 ms = 1 second
      return null;
    }
    _lastProcessedTime = currentTime;

    try {
      var recognitions = await Tflite.detectObjectOnFrame(
        bytesList: image.planes.map((plane) => plane.bytes).toList(),
        model: "YOLO",
        imageHeight: image.height,
        imageWidth: image.width,
        imageMean: 0,
        imageStd: 255.0,
        threshold: 0.2,
        numResultsPerClass: 1,
      );
      print("Detection results: $recognitions");
      return recognitions;
    } catch (e) {
      print("Error during model inference: $e");
      return null;
    }
  }

}





