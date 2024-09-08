// features/image_classification/data/repositories/image_repository_impl.dart

import 'package:camera/camera.dart';
import '../../domain/entities/prediction.dart';
import '../../domain/repositories/image_repository.dart';
import '../data_source/image_data_source_impl.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSourceImpl _imageDataSource = ImageDataSourceImpl();

  @override
  Future<List<Prediction>?> classifyStream(CameraImage cameraImage) async {
    final results = await _imageDataSource.classifyStream(cameraImage);
    if (results == null) return null;

    return results.map((result) {
      return Prediction(
        label: result['label'] as String,
        confidence: result['confidence'] as double,
      );
    }).toList();
  }

  Future<void> loadModel() async {
    await _imageDataSource.loadModel();
  }
}
