// lib/presentation/widgets/bounding_boxes.dart
import 'package:flutter/material.dart';
import '../../domain/entities/detection_result.dart';

class BoundingBoxes extends StatelessWidget {
  final List<DetectionResult>? recognitions;

  const BoundingBoxes({
    super.key,
    required this.recognitions,
  });

  @override
  Widget build(BuildContext context) {
    var screenH = MediaQuery.of(context).size.height;
    var screenW = MediaQuery.of(context).size.width;

    List<Widget> boxes = [];

    if (recognitions != null) {
      for (var re in recognitions!) {
        double x = re.x * screenW;
        double w = re.width * screenW;
        double y = re.y * screenH;
        double h = re.height * screenH;
        String label = '${re.detectedClass} ${re.confidence.toStringAsFixed(2)}%';

        boxes.add(
          Positioned(
            left: x,
            top: y,
            child: Container(
              width: w,
              height: h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 3),
              ),
              child: Text(label, style: const TextStyle(color: Colors.white)),
            ),
          ),
        );
      }
    }

    return Stack(children: boxes);
  }
}
