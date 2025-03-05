import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final String? imageUrl;

  const ProfilePicture({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: imageUrl != null
          ? NetworkImage(imageUrl!)
          : AssetImage('assets/images/default_avatar.png') as ImageProvider,
    );
  }
}
