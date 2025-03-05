import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  final String name;
  final String email;

  const ProfileInfo({Key? key, required this.name, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        Text(email, style: TextStyle(fontSize: 18, color: Colors.grey)),
      ],
    );
  }
}
