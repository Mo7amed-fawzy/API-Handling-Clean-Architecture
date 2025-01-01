import 'package:happy_tech_mastering_api_with_flutter/core/end_points.dart';

class GetUserModel {
  final String profilePic;
  final String email;
  final String phone;
  final String name;
  final Map<String, dynamic> address;

  GetUserModel(
      {required this.profilePic,
      required this.email,
      required this.phone,
      required this.name,
      required this.address});

  factory GetUserModel.fromJson(Map<String, dynamic> jsonData) {
    return GetUserModel(
        // profilePic: jsonData['user'][ApiKey.profilePic],
        // التحقق من وجود `profilePic` وتوفير قيمة افتراضية إذا كانت `null`
        profilePic: jsonData['user'][ApiKey.profilePic] ??
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.gq.com%2Fmen-of-the-year&psig=AOvVaw2fojJZFNoiFeXHXxP9psbq&ust=1727216428471000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCMDg9OGM2ogDFQAAAAAdAAAAABAE',
        email: jsonData['user'][ApiKey.email],
        phone: jsonData['user'][ApiKey.phone],
        name: jsonData['user'][ApiKey.name],
        address: jsonData['user'][ApiKey.location]);
  }
  // دالة لتحويل كائن GetUserModel إلى خريطة
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  // إذا كان لديك دالة copyWith، يمكنك إضافتها هنا
  GetUserModel copyWith({
    String? name,
    String? email,
    String? phone,
  }) {
    return GetUserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profilePic: '',
      address: {},
    );
  }
}
