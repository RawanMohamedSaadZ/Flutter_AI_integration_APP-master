// lib/domain/entities/detection_result.dart
class DetectionResult {
  final String detectedClass;
  final double confidence;
  final double x;
  final double y;
  final double width;
  final double height;

  DetectionResult({
    required this.detectedClass,
    required this.confidence,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
  });
}
