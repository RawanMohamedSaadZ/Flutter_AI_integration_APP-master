// features/cat_images/data/models/cat_image_model.dart
import '../../domain/entities/cat_image.dart';

class CatImageModel extends CatImage {
  CatImageModel({required String url}) : super(url: url);

  factory CatImageModel.fromJson(Map<String, dynamic> json) {
    return CatImageModel(url: json['url']);
  }
}
