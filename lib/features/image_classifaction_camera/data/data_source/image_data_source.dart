// features/image_classification/data/data_source/image_data_source.dart

import 'package:camera/camera.dart';

abstract class ImageDataSource {
  Future<List<Map<String, dynamic>>?> classifyStream(CameraImage cameraImage);
  Future<void> loadModel();
}
