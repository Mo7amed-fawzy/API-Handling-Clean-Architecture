import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Core/databases/api/end_point.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/domain/entites/sub_entity/geo_entity.dart';

class GeoModel extends GeoEntity {
  GeoModel({required super.lat, required super.lng});

  factory GeoModel.fromjson(Map<String, dynamic> json) {
    return GeoModel(lat: json[ApiKey.lat], lng: json[ApiKey.lng]);
  }

  Map<String, dynamic> tojson() {
    return {
      ApiKey.lat: lat,
      ApiKey.lng: lng,
    };
  }
}
