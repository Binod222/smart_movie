import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:smart_movie/app/usecase/usecase.dart';
import 'package:smart_movie/core/error/failure.dart';
import 'package:smart_movie/features/auth/domain/repository/user_repository.dart';


class UploadImageParams {
  final File file;

  const UploadImageParams({
    required this.file,
  });
}

class UploadImageUsecase
    implements UsecaseWithParams<String, UploadImageParams> {
  final IUserRepository _repository;

  UploadImageUsecase(this._repository);

  @override
  Future<Either<Failure, String>> call(UploadImageParams params) {
    return _repository.uploadProfilePicture(params.file);
  }
}