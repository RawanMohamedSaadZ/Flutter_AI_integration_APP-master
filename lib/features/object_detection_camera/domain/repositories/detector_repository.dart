// lib/domain/repositories/detector_repository.dart
import '../entities/detection_result.dart';

abstract class DetectorRepository {
  Future<void> loadModel();
  Stream<List<DetectionResult>> startDetection();
  Future<void> stopDetection();
}
