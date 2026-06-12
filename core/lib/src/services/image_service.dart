import 'dart:io';
import 'package:image_picker/image_picker.dart';

/// Media picking utilities.
abstract final class ImageService {
  /// Picks an image from the gallery. Returns a [File] or `null` if cancelled.
  static Future<File?> pickImage() async {
    final XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);

    return file == null ? null : File(file.path);
  }

  /// Picks a video from gallery or camera. Returns a [File] or `null` if cancelled.
  static Future<File?> pickVideo({
    ImageSource source = ImageSource.gallery,
    Duration? maxDuration,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
  }) async {
    final XFile? file = await ImagePicker().pickVideo(
      source: source,
      maxDuration: maxDuration,
      preferredCameraDevice: preferredCameraDevice,
    );

    return file == null ? null : File(file.path);
  }
}
