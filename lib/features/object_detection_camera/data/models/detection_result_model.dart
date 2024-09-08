// lib/data/models/detection_result_model.dart
import '../../domain/entities/detection_result.dart';

class DetectionResultModel extends DetectionResult {
  DetectionResultModel({
    required String detectedClass,
    required double confidence,
    required double x,
    required double y,
    required double width,
    required double height,
  }) : super(
    detectedClass: detectedClass,
    confidence: confidence,
    x: x,
    y: y,
    width: width,
    height: height,
  );

  factory DetectionResultModel.fromJson(Map<String, dynamic> json) {
    return DetectionResultModel(
      detectedClass: json['detectedClass'],
      confidence: json['confidence'],
      x: json['rect']['x'],
      y: json['rect']['y'],
      width: json['rect']['w'],
      height: json['rect']['h'],
    );
  }
}
