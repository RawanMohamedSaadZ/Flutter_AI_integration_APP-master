// features/image_classification/domain/entities/prediction.dart

class Prediction {
  final String label;
  final double confidence;

  Prediction({required this.label, required this.confidence});
}
