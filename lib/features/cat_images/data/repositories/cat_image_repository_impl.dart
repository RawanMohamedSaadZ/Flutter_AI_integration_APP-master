// features/cat_images/data/repositories/cat_image_repository_impl.dart
import '../../domain/entities/cat_image.dart';
import '../../domain/repositories/cat_image_repository.dart';
import '../data_sources/cat_image_remote_data_source.dart';

class CatImageRepositoryImpl implements CatImageRepository {
  final CatImageRemoteDataSource remoteDataSource;

  CatImageRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<CatImage>> fetchCatImages() async {
    return await remoteDataSource.fetchCatImages();
  }
}
