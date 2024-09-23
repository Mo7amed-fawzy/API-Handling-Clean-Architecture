import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

Future uploadImageToAPI(XFile image) async {
  // بتاخد الصورة وبتحولها لشكل اقدر ارفعو لل api علطول
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}
