import 'package:image_picker/image_picker.dart';
import 'dart:io';

/// Function to pick an image from the gallery
Future<File?> pickImage() async {
  final ImagePicker _picker = ImagePicker();

  try {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      print('No image selected.');
      return null;
    }
  } catch (e) {
    print('Error picking image: $e');
    return null;
  }
}
