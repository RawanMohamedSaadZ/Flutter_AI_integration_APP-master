// features/image_classification/presentation/controllers/camera_controller.dart

import 'package:camera/camera.dart';
import '../../domain/usecases/classify_stream_usecase.dart';

class CameraViewController {
  CameraController? _cameraController;
  bool isCameraInitialized = false;
  bool isModelLoaded = false;
  String answer = "Detecting...";
  bool isPreviewPaused = false;
  double cameraAspectRatio = 1.0;

  Future<void> initializeCamera() async {
    final classifyStreamUseCase = ClassifyStreamUseCase();
    await classifyStreamUseCase.loadModel();
    isModelLoaded = true;

    final cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.ultraHigh);
    await _cameraController!.initialize();

    cameraAspectRatio = _cameraController!.value.aspectRatio;
    isCameraInitialized = true;
    _startImageStream(classifyStreamUseCase);
  }

  void _startImageStream(ClassifyStreamUseCase classifyStreamUseCase) {
    _cameraController!.startImageStream((cameraImage) async {
      final predictions = await classifyStreamUseCase(cameraImage);
      if (predictions != null && predictions.isNotEmpty) {
        String label = predictions.first.label;
        double confidence = predictions.first.confidence;
        answer = "$label - ${(confidence * 100).toStringAsFixed(2)}%";
      }
    });
  }

  void toggleCameraPreview() {
    isPreviewPaused = !isPreviewPaused;
    if (isPreviewPaused) {
      _cameraController!.pausePreview();
    } else {
      _cameraController!.resumePreview();
    }
  }

  CameraController? get cameraController => _cameraController;

  void dispose() {
    _cameraController?.dispose();
  }
}
