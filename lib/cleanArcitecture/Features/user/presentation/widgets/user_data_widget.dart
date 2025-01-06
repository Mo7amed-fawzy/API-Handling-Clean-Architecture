import 'package:flutter/material.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/domain/entites/user_entitiy.dart';

class UserData extends StatelessWidget {
  const UserData({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.person),
          iconColor: Colors.blueAccent,
          title: Text(user.name),
        ),
        ListTile(
          leading: const Icon(Icons.email),
          iconColor: Colors.blueAccent,
          title: Text(user.email),
        ),
        ListTile(
          leading: const Icon(Icons.phone),
          iconColor: Colors.blueAccent,
          title: Text(user.phone),
        ),
        ListTile(
          leading: const Icon(Icons.location_city),
          iconColor: Colors.blueAccent,
          title: Text(user.address.city),
        ),
      ],
    );
  }
}
