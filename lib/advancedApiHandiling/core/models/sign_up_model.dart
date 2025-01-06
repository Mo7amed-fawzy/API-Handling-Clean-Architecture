import 'package:happy_tech_mastering_api_with_flutter/advancedApiHandiling/core/end_points.dart';

// مودل للرسالة بتعات الضن انك سجلت
class SignUpModel {
  final String message;

  SignUpModel({required this.message});

  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(message: jsonData[ApiKey.message]);
  }
}
