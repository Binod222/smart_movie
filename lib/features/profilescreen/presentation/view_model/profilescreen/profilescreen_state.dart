import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  final String name;
  final String email;
  final String profilePicture;

  const ProfileState({
    required this.name,
    required this.email,
    required this.profilePicture,
  });

  @override
  List<Object?> get props => [name, email, profilePicture];

  ProfileState copyWith({
    String? name,
    String? email,
    String? profilePicture,
  }) {
    return ProfileState(
      name: name ?? this.name,
      email: email ?? this.email,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }
}
