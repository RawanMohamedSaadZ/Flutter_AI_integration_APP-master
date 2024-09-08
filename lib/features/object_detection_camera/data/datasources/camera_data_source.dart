import 'dart:async';
import 'package:camera/camera.dart';

class CameraDataSource {
  CameraController? _cameraController;
  StreamController<CameraImage>? _imageStreamController;

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.max);
    await _cameraController!.initialize();
  }

  Stream<CameraImage> startImageStream() {
    if (_cameraController == null) {
      throw Exception('Camera not initialized');
    }

    // Create a StreamController to manage the image stream
    _imageStreamController = StreamController<CameraImage>();

    // Start the image stream and add each image to the StreamController
    _cameraController!.startImageStream((CameraImage image) {
      if (!_imageStreamController!.isClosed) {
        _imageStreamController!.add(image);
      }
    });

    // Return the stream
    return _imageStreamController!.stream;
  }

  Future<void> stopImageStream() async {
    await _cameraController?.stopImageStream();
    await _imageStreamController?.close();
  }

  Future<void> dispose() async {
    await _cameraController?.dispose();
    _cameraController = null;
    await _imageStreamController?.close();
    _imageStreamController = null;
  }
}
