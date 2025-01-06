import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Core/databases/api/end_point.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/data/models/sub_models/geo_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/domain/entites/sub_entity/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel(
      {required super.street,
      required super.suite,
      required super.city,
      required super.zipcode,
      required super.geo});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json[ApiKey.street],
      suite: json[ApiKey.suite],
      city: json[ApiKey.city],
      zipcode: json[ApiKey.zipcode],
      geo: GeoModel.fromJson(
          json[ApiKey.geo]), // تحويل الـ geo باستخدام GeoModel
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.street: street,
      ApiKey.suite: suite,
      ApiKey.city: city,
      ApiKey.zipcode: zipcode,
      ApiKey.geo: (geo as GeoModel).toJson(), // تحويل geo إلى GeoModel
    };
  }
}
