import 'package:dartz/dartz.dart';
import 'package:smart_movie/core/errors/failure.dart';
import 'package:smart_movie/features/auth/domain/entity/auth_entity.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, void>> registerUser(AuthEntity entity);

  Future<Either<Failure, String>> loginUser(String userName, String password);

  // Future<Either<Failure, String>> uploadProfilePicture(File file);

  Future<Either<Failure, AuthEntity>> getCurrentUser();
}
