import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import '../../../AI_Model/model/model.dart';
import '../../../detector/detector_screen.dart';

class DetectorPage extends StatefulWidget {
  const DetectorPage({super.key});
  @override
  DetectorPageState createState() => DetectorPageState();
}

class DetectorPageState extends State<DetectorPage> {
  CameraController?_cameraController;
  bool _isCameraInitialized = false;

  List<dynamic>? _recognitions;

  @override
  void initState() {
    super.initState();
    initialize();
  }



  Future<void> initialize() async {
    await ModelClass.loadYOLOModel();
    final cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.max);
    _cameraController!.initialize().then((_) {
      if (!mounted) return;

      setState(() {
        _isCameraInitialized = true;
      });

      _startImageStream();

    }).catchError((error) {
      print("Camera initialization error: $error");
    });
  }

  void _startImageStream() {
    if (!ModelClass.isModelLoaded) {
      print("Model not loaded, skipping frame.");
      return;
    } // Ensure model is loaded before starting stream

    _cameraController!.startImageStream((cameraImage) async {

      var predictions = await ModelClass.ImageDetection(cameraImage);

      if (predictions != null && predictions.isNotEmpty) {
        setState(() {
          _recognitions = predictions;
        });
      }

    });
  }


  @override
  void dispose() {
    _cameraController?.stopImageStream().then((_) {
      _cameraController?.dispose();
    });
    ModelClass.closeModel();
    super.dispose();
  }

  bool flg = true;
  @override
  Widget build(BuildContext context) {


    if (!ModelClass.isModelLoaded || !_isCameraInitialized) {
      return const Center(
        child:  CircularProgressIndicator(color:  Color(0xFFA7BAE0)),);
    }else
    {
      return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor:  const Color(0xFFA7BAE0),
            onPressed: (){
              setState(() {
                flg = !flg;
              });
              if (flg){
                _cameraController!.resumePreview();
              }else{
                _cameraController!.pausePreview();
              }
            },
            child: Icon(flg ? Icons.pause : Icons.play_arrow,color: Colors.white,),

          ),
          body: Stack(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: AspectRatio(
                  aspectRatio: _cameraController!.value.aspectRatio,
                  child: CameraPreview(
                    _cameraController!,
                  ),
                ),
              ),
              BoundingBoxes(
                recognitions: _recognitions,
              ),
            ],
          ),
        ),
      );
    }
  }

}


