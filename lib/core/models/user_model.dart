import 'package:happy_tech_mastering_api_with_flutter/core/end_points.dart';

class UserModel {
  final String profilePic;
  final String email;
  final String phone;
  final String name;
  final Map<String, dynamic> address;

  UserModel(
      {required this.profilePic,
      required this.email,
      required this.phone,
      required this.name,
      required this.address});

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
        // profilePic: jsonData['user'][ApiKey.profilePic],
        // التحقق من وجود `profilePic` وتوفير قيمة افتراضية إذا كانت `null`
        profilePic: jsonData['user'][ApiKey.profilePic] ??
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.gq.com%2Fmen-of-the-year&psig=AOvVaw2fojJZFNoiFeXHXxP9psbq&ust=1727216428471000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCMDg9OGM2ogDFQAAAAAdAAAAABAE',
        email: jsonData['user'][ApiKey.email],
        phone: jsonData['user'][ApiKey.phone],
        name: jsonData['user'][ApiKey.name],
        address: jsonData['user'][ApiKey.location]);
  }
}
