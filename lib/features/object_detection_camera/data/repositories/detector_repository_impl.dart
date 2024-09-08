// lib/data/repositories/detector_repository_impl.dart
import '../../domain/entities/detection_result.dart';
import '../../domain/repositories/detector_repository.dart';
import '../datasources/camera_data_source.dart';
import '../datasources/model_data_source.dart';

class DetectorRepositoryImpl implements DetectorRepository {
  final CameraDataSource cameraDataSource;
  final ModelDataSource modelDataSource;

  DetectorRepositoryImpl({
    required this.cameraDataSource,
    required this.modelDataSource,
  });

  @override
  Future<void> loadModel() async {
    await modelDataSource.loadModel();
    await cameraDataSource.initializeCamera();
  }

  @override
  Stream<List<DetectionResult>> startDetection() async* {
    await loadModel();
    await for (var image in cameraDataSource.startImageStream()) {
      yield await modelDataSource.detectObjects(image);
    }
  }

  @override
  Future<void> stopDetection() async {
    await cameraDataSource.stopImageStream();
    await modelDataSource.closeModel();
  }
}
