// features/cat_images/domain/repositories/cat_image_repository.dart
import '../entities/cat_image.dart';

abstract class CatImageRepository {
  Future<List<CatImage>> fetchCatImages();
}
