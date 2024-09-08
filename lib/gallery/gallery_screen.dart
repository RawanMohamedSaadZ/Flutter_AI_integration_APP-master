import 'package:flutter/material.dart';
import 'package:image_classification_app/core/constants/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../features/AI_Model/model/model.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  GalleryScreenState createState() => GalleryScreenState();
}

class GalleryScreenState extends State<GalleryScreen> {
  String _result = '';
  XFile? _image;

  Future<void> _pickImage() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
      ModelClass.classifyImage(pickedImage.path).then((result) {
        setState(() {
          _result = result;
        });
      });
    }
  }

  @override
  void dispose() {
    ModelClass.closeModel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: AppColors.Purple,
          titleSpacing: 40,
          title: const Text(
            'Gallery View',
            style:  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0))),
                  backgroundColor:
                  MaterialStateProperty.all(AppColors.gallery)),
              onPressed: _pickImage,
              child: const Text(
                'Select Image from Gallery',
                style:  TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            _image == null
                ? const Text('Selecte an Image first.')
                : Image.file(File(_image!.path)),

            const SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(
                  fontSize: 18 * MediaQuery.of(context).textScaleFactor,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}