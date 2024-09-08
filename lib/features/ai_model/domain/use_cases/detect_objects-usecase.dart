// domain/usecases/detect_objects_usecase.dart
import 'package:camera/camera.dart';

import '../entities/prediction.dart';
import '../repository/image_repository.dart';

class DetectObjectsUseCase {
  final ImageRepository repository;

  DetectObjectsUseCase(this.repository);

  Future<List<Prediction>?> execute(CameraImage image) async {
    return await repository.detectObjects(image);
  }
}
