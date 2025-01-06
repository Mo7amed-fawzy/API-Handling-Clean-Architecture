import 'package:happy_tech_mastering_api_with_flutter/advancedApiHandiling/core/end_points.dart';

class SignInModel {
  // بيبقي شايل الريسبونس البيرجعلي لما اعمل ساينان الهي رسايل الستاتس كود
  final String message;
  final String token;

  SignInModel({required this.message, required this.token});

  factory SignInModel.fromJson(Map<String, dynamic> jsondata) {
    return SignInModel(
        message: jsondata[ApiKey.message],
        // كدا معايه التوكن اقدر ااكسس عليه
        token: jsondata[ApiKey.token]);
  }
}
