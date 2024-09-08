// features/image_classification/domain/repositories/image_repository.dart

import 'package:camera/camera.dart';
import '../entities/prediction.dart';

abstract class ImageRepository {
  Future<List<Prediction>?> classifyStream(CameraImage cameraImage);
}
