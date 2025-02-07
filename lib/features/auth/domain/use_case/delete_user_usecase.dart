import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_movie/app/shared_prefs/token_shared_prefs.dart';
import 'package:smart_movie/app/usecase/usecase.dart';
import 'package:smart_movie/core/error/failure.dart';
import 'package:smart_movie/features/auth/domain/repository/user_repository.dart';

class DeleteUserParams extends Equatable {
  final String userId;

  const DeleteUserParams({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class DeleteUserUsecase implements UsecaseWithParams<void, DeleteUserParams> {
  final IUserRepository userRepository;
  final TokenSharedPrefs tokenSharedPrefs;

  DeleteUserUsecase(
      {required this.userRepository, required this.tokenSharedPrefs});

  @override
  Future<Either<Failure, void>> call(DeleteUserParams params) async {
    final tokenResult = await tokenSharedPrefs.getToken();

    return tokenResult.fold(
      (failure) => Left(failure),
      (token) => userRepository.deleteUser(params.userId, token),
    );
  }
}
