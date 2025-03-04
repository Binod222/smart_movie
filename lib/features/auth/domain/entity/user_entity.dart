import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? userId;
  final String fullName;
  final String email;
  final String password;
  final String role;
  final String? avatar;

  const UserEntity({
    this.userId,
    required this.fullName,
    required this.email,
    required this.password,
    required this.role,
    this.avatar,
  });

  //Create an empty constructor or initial constructor
  const UserEntity.empty()
      : userId = '_empty.userId',
        fullName = '_empty.fullname',
        email = '_empty.email',
        password = '_empty.password',
        role = '_empty.role',
        avatar = '_empty.avatar';

  @override
  List<Object?> get props => [
        userId,
        email,
      ];
}
