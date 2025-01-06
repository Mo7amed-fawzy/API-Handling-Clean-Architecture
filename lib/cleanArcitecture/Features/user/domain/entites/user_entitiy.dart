// file: lib/features/user/domain/entities/user_entity.dart
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/domain/entites/sub_entity/address_entity.dart';

class UserEntity {
  final String name;
  final String phone;
  final String email;
  final AddressEntity address;

  UserEntity({
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
  });
}
