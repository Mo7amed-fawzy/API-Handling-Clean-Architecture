// file: lib/features/user/domain/entities/address_entity.dart
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/domain/entites/sub_entity/geo_entity.dart';

class AddressEntity {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoEntity geo;

  AddressEntity({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });
}
