// domain/repositories/image_repository.dart
import 'package:camera/camera.dart';
import '../entities/prediction.dart';

abstract class ImageRepository {

  Future<String> classifyStream(CameraImage cameraImage);
  Future<String> classifyImage(String imagePath);
  Future<List<Prediction>?> detectObjects(CameraImage image);
}
