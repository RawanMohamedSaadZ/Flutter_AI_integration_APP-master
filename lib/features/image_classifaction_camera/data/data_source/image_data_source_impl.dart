// features/image_classification/data/data_source/image_data_source_impl.dart

import 'package:camera/camera.dart';
import '../../../ai_model/data/data_source/image_datasources.dart';
import '../../../ai_model/model/model.dart';

class ImageDataSourceImpl implements ImageDataSource {
  @override
  Future<List<Map<String, dynamic>>?> classifyStream(CameraImage cameraImage) async {
    final result = await ModelClass.classifyStream(cameraImage);

    // If the result is List<dynamic>?, cast it to List<Map<String, dynamic>>?
    if (result != null) {
      return result.cast<Map<String, dynamic>>();
    }
    return null;
  }

  @override
  Future<void> loadModel() async {
    await ModelClass.loadModel();
  }
}
