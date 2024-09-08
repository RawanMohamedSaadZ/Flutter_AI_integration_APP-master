// domain/usecases/classify_image_usecase.dart
import 'package:camera/camera.dart';

import '../entities/prediction.dart';
import '../repository/image_repository.dart';

class ClassifyImageUseCase {
  final ImageRepository repository;

  ClassifyImageUseCase(this.repository);

  Future<String> execute(CameraImage cameraImage) async {
    return await repository.classifyStream(cameraImage);
  }
}

