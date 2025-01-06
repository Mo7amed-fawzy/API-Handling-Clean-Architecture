import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Core/databases/api/end_point.dart';

class CompanyModel {
  final String companyName;
  final String catchPhrase;
  final String bs;

  CompanyModel(
      {required this.companyName, required this.catchPhrase, required this.bs});

  factory CompanyModel.fromjson(Map<String, dynamic> json) {
    return CompanyModel(
      companyName: json[ApiKey.companyName],
      catchPhrase: json[ApiKey.catchPhrase],
      bs: json[ApiKey.bs],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.companyName: companyName,
      ApiKey.catchPhrase: catchPhrase,
      ApiKey.bs: bs,
    };
  }
}
