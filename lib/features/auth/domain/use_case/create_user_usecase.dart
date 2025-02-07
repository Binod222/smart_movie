import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_movie/app/usecase/usecase.dart';
import 'package:smart_movie/core/error/failure.dart';
import 'package:smart_movie/features/auth/domain/entity/user_entity.dart';
import 'package:smart_movie/features/auth/domain/repository/user_repository.dart';

class CreateUserParams extends Equatable {
  final String fullName;
  final String email;
  final String password;
  final String phone;
  final String address;
  final String role;
  final String? avatar;

  const CreateUserParams({
    required this.fullName,
    required this.email,
    required this.password,
    required this.phone,
    required this.address,
    required this.role,
    this.avatar,
  });

  //Empty constructor
  const CreateUserParams.empty()
      : fullName = '_empty.fullName',
        email = '_empty.email',
        password = '_empty.password',
        phone = '_empty.phone',
        address = '_empty.address',
        role = '_empty.role',
        avatar = '_empty.avatar';

  @override
  List<Object?> get props => [fullName];
}

class CreateUserUsecase implements UsecaseWithParams<void, CreateUserParams> {
  final IUserRepository userRepository;

  CreateUserUsecase({required this.userRepository});

  @override
  Future<Either<Failure, void>> call(CreateUserParams params) async {
    return await userRepository.createUser(
      UserEntity(
        fullName: params.fullName,
        email: params.email,
        password: params.password,
        phone: params.phone,
        address: params.address,
        role: params.role,
        avatar: params.avatar,
      ),
    );
  }
}
