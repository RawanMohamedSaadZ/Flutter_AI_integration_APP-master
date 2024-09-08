// features/cat_images/data/data_sources/cat_image_remote_data_source.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cat_image_model.dart';

abstract class CatImageRemoteDataSource {
  Future<List<CatImageModel>> fetchCatImages();
}

class CatImageRemoteDataSourceImpl implements CatImageRemoteDataSource {
  final http.Client client;

  CatImageRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CatImageModel>> fetchCatImages() async {
    final response = await client.get(
      Uri.parse('https://api.thecatapi.com/v1/images/search?limit=10'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((cat) => CatImageModel.fromJson(cat)).toList();
    } else {
      throw Exception('Failed to load cat images');
    }
  }
}
