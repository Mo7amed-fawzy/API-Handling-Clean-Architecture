import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Core/databases/api/end_point.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/domain/entites/sub_entity/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel(
      {required super.street,
      required super.suite,
      required super.city,
      required super.zipcode,
      required super.geo});

  factory AddressModel.fromjson(Map<String, dynamic> json) {
    return AddressModel(
        street: json[ApiKey.street],
        suite: json[ApiKey.suite],
        city: json[ApiKey.city],
        zipcode: json[ApiKey.zipcode],
        geo: json[ApiKey.geo]);
  }

  Map<String, dynamic> tojson() {
    return {
      ApiKey.street: street,
      ApiKey.suite: suite,
      ApiKey.city: city,
      ApiKey.zipcode: zipcode,
      ApiKey.geo: geo,
    };
  }
}
