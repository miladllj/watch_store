import 'dart:developer';
import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHandler {
  File? _image;

  Future<void> pickAndCropImage({required ImageSource source}) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      _image = img;
    } catch (e) {
      log('Image Picking Error ::: ${e.toString()}');
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedFile =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedFile == null) return null;
    return File(croppedFile.path);
  }

  File? get getImage => _image;
}
