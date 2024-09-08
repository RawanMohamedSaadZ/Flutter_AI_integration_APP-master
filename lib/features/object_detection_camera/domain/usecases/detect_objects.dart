// lib/domain/usecases/detect_objects.dart
import '../repositories/detector_repository.dart';
import '../entities/detection_result.dart';

class DetectObjects {
  final DetectorRepository repository;

  DetectObjects(this.repository);

  Stream<List<DetectionResult>> call() {
    return repository.startDetection();
  }
}
