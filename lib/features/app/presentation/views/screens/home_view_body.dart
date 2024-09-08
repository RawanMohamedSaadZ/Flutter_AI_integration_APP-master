import 'package:flutter/material.dart';
import 'package:image_classification_app/core/Components/custom_button_home.dart';
import '../../../../../gallery/gallery_screen.dart';
import '../../../../image_classifaction_camera/presentation/pages/camera_screen.dart';

class home_view_body extends StatelessWidget {
  const home_view_body({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Container(),
          ),
          CustomButtonHome(
            text: 'Open Camera',
            Navigate: CameraScreen(),
          ),
           Expanded(
            flex: 0 ,
            child: SizedBox(height: 20,),
          ),

          CustomButtonHome(
            text: 'Open Gallery',
            Navigate:  GalleryScreen(),
          ),
          Flexible(
              flex: 1,
              child: Container()) ,
        ],
      ),
    );
  }
}
