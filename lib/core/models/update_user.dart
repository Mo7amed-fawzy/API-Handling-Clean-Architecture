import 'package:happy_tech_mastering_api_with_flutter/core/end_points.dart';

class UpdateUserModel {
  final String message;

  UpdateUserModel({required this.message});

  factory UpdateUserModel.fromJson(Map<String, dynamic> jsonData) {
    return UpdateUserModel(
      message: jsonData[ApiKey.message],
    );
  }
}
