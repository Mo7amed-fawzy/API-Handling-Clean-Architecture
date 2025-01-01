import 'sub_entity/address_entity.dart';

class UserEntitiy {
  final String name;
  final String phone;
  final String email;
  final AddressEntity address;

  UserEntitiy(
      {required this.name,
      required this.phone,
      required this.email,
      required this.address});
}
