import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_movie/features/profilescreen/presentation/view_model/profilescreen/profilescreen_cubit.dart';
import 'package:smart_movie/features/profilescreen/presentation/view_model/profilescreen/profilescreen_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: Colors.blueAccent,
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            final profileCubit = context.read<ProfileCubit>();
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile Picture
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(state.profilePicture),
                  ),
                  const SizedBox(height: 20),
                  // Name Field
                  TextFormField(
                    initialValue: state.name,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      profileCubit.updateName(value);
                    },
                  ),
                  const SizedBox(height: 20),
                  // Email Field
                  TextFormField(
                    initialValue: state.email,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      profileCubit.updateEmail(value);
                    },
                  ),
                  const SizedBox(height: 20),
                  // Change Profile Picture Button
                  ElevatedButton(
                    onPressed: () {
                      // Implement image picker logic here
                      profileCubit.updateProfilePicture(
                          'assets/images/new_profile.png');
                    },
                    child: const Text('Change Profile Picture'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
