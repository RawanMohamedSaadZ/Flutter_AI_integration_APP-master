// features/cat_images/domain/use_cases/fetch_cat_images.dart
import '../entities/cat_image.dart';
import '../repositories/cat_image_repository.dart';

class FetchCatImages {
  final CatImageRepository repository;

  FetchCatImages(this.repository);

  Future<List<CatImage>> call() async {
    return await repository.fetchCatImages();
  }
}
