// data/data_source/image_datasources.dart

import 'package:camera/camera.dart';

abstract class ImageDataSource {
  Future<List<dynamic>?> classifyStream(CameraImage cameraImage);
}
