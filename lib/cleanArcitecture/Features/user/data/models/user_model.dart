import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Core/databases/api/end_point.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/data/models/sub_models/company_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/domain/entites/user_entitiy.dart';

class UserModel extends UserEntitiy {
  // هستقبل username دا محتاجو انما الباقي انا مش محتاجو فهبعتو فال superModel بتاعي
  int id;
  final String username;
  final String website;
  final CompanyModel company;
  UserModel({
    required this.id,
    required super.name,
    required super.phone,
    required super.email,
    required super.address,
    required this.username,
    required this.website,
    required this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    // دي بخزن بيها الداتا الجاية من ال api
    return UserModel(
      id: json[ApiKey.id],
      name: json[ApiKey.name],
      phone: json[ApiKey.phone],
      email: json[ApiKey.email],
      username: json[ApiKey.username],
      website: json[ApiKey.website],
      // address: json[ApiKey.address], // دول مميزين
      // company: json[ApiKey.company],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
      "username": username,
      "website": company,
      "address": address,
    };
  }
}
