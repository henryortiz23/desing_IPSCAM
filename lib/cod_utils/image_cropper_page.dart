import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

Future<String> imageCropperView(String? path, BuildContext context) async {
  CroppedFile? croppedFile = await ImageCropper().cropImage(
    sourcePath: path!,
    aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ],

    uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Recortar imagen',
          toolbarColor: Theme.of(context).colorScheme.primary,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      IOSUiSettings(
        title: 'Recortar imagen',
      ),
      WebUiSettings(
        context: context,
      ),
    ],
  );

  if (croppedFile != null) {
    return croppedFile.path;
  } else {
    return '';
  }
}
