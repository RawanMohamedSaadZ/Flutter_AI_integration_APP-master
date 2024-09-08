// features/image_classification/domain/usecases/classify_stream_usecase.dart

import 'package:camera/camera.dart';
import '../../data/repositories/image_repository_impl.dart';
import '../entities/prediction.dart';

class ClassifyStreamUseCase {
  final ImageRepositoryImpl _imageRepository = ImageRepositoryImpl();

  Future<List<Prediction>?> call(CameraImage cameraImage) async {
    // Call the repository method and handle errors
    return await _imageRepository.classifyStream(cameraImage);
  }

  Future<void> loadModel() async {
    await _imageRepository.loadModel();
  }
}
