import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Core/databases/api/end_point.dart';

class CompanyModel {
  final String name;
  final String catchPhrase;
  final String bs;

  CompanyModel(
      {required this.name, required this.catchPhrase, required this.bs});

  factory CompanyModel.fromjson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json[ApiKey.name],
      catchPhrase: json[ApiKey.catchPhrase],
      bs: json[ApiKey.bs],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      ApiKey.name: name,
      ApiKey.catchPhrase: catchPhrase,
      ApiKey.bs: bs,
    };
  }
}
