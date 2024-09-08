// data/repositories/image_repository_impl.dart
import 'package:camera/camera.dart';
import 'package:image_classification_app/features/AI_Model/model/model.dart';
import '../../domain/entities/prediction.dart';
import '../../domain/repository/image_repository.dart';
import '../data_source/image_datasources.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource _imageDataSource;

  ImageRepositoryImpl(this._imageDataSource);

  @override
  Future<String> classifyImage(String imagePath) async {
    return await ModelClass.classifyImage(imagePath);
  }

  @override
  Future<List<Prediction>?> ClassifyStream(CameraImage cameraImage) async {
    final results = await _imageDataSource.classifyStream(cameraImage);
    if (results == null) return null;

    return results.map((result) {
      return Prediction(
        label: result['label'],
        confidence: result['confidence'],
      );
    }).toList();
  }

  @override
  Future<List<Prediction>?> detectObjects(CameraImage image) {
    // TODO: implement detectObjects
    throw UnimplementedError();
  }

  @override
  Future<String> classifyStream(CameraImage cameraImage) {
    // TODO: implement classifyStream
    throw UnimplementedError();
  }
}
  @override
  Future<List<Prediction>?> detectObjects(CameraImage image) async {
    final results = await ModelClass.ImageDetection(image);
    return results?.map((result) => Prediction(
      label: result['detectedClass'],
      confidence: result['confidenceInClass'] * 100,
    )).toList();
  }



