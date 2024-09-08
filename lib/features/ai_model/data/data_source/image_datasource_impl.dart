// data/data_source/image_datasource_impl.dart

import 'package:camera/camera.dart';
import '../../model/model.dart';
import 'image_datasources.dart';

class ImageDataSourceImpl implements ImageDataSource {
  @override
  Future<List<dynamic>?> classifyStream(CameraImage cameraImage) async {
    return await ModelClass.classifyStream(cameraImage);
  }
}
