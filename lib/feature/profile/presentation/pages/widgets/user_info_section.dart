import 'package:flutter/material.dart';
import 'package:pokemon_task/feature/profile/domain/entities/user_entity.dart';

class UserInfoSection extends StatelessWidget {
  final UserEntity user;

  const UserInfoSection({required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          user.displayName,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          user.email,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}