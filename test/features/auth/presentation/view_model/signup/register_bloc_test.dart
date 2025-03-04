// import 'dart:io';

// import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:smart_movie/core/error/failure.dart';
// import 'package:smart_movie/features/auth/domain/use_case/create_user_usecase.dart';
// import 'package:smart_movie/features/auth/domain/use_case/upload_image_usecase.dart';
// import 'package:smart_movie/features/auth/presentation/view_model/signup/register_bloc.dart';

// class MockCreateUserUsecase extends Mock implements CreateUserUsecase {}

// class MockUploadImageUsecase extends Mock implements UploadImageUsecase {}

// class MockBuildContext extends Mock implements BuildContext {}

// void main() {
//   late RegisterBloc registerBloc;
//   late MockCreateUserUsecase createUserUsecase;
//   late MockUploadImageUsecase uploadImageUsecase;
//   late MockBuildContext mockContext;

//   setUp(() {
//     createUserUsecase = MockCreateUserUsecase();
//     uploadImageUsecase = MockUploadImageUsecase();
//     mockContext = MockBuildContext();

//     registerFallbackValue(const CreateUserParams(
//       fullName: '',
//       email: '',
//       password: '',
//       role: 'user',
//     ));

//     registerBloc = RegisterBloc(
//       createUserUsecase: createUserUsecase,
//       uploadImageUsecase: uploadImageUsecase,
//     );
//   });

//   tearDown(() {
//     registerBloc.close();
//   });

//   group('RegisterBloc', () {
//     const userParams = CreateUserParams(
//       fullName: 'John Doe',
//       email: 'john@example.com',
//       password: 'password123',
//       role: 'user',
//       avatar: null,
//     );

//     test('Initial state should be RegisterState.initial()', () {
//       expect(registerBloc.state, RegisterState.initial());
//     });

//     blocTest<RegisterBloc, RegisterState>(
//       'emits [loading, success] when RegisterUserEvent is successful',
//       build: () {
//         when(() => createUserUsecase.call(any()))
//             .thenAnswer((_) async => const Right(null));
//         return registerBloc;
//       },
//       act: (bloc) => bloc.add(RegisterUserEvent(
//         fullName: userParams.fullName,
//         email: userParams.email,
//         password: userParams.password,
//         avatar: null,
//         context: mockContext,
//         confirmPassword: userParams.confirmPassword,
//       )),
//       expect: () => [
//         RegisterState.initial().copyWith(isLoading: true),
//         RegisterState.initial().copyWith(isLoading: false, isSuccess: true),
//       ],
//     );

//     blocTest<RegisterBloc, RegisterState>(
//       'emits [loading, failure] when RegisterUserEvent fails',
//       build: () {
//         when(() => createUserUsecase.call(any()))
//             .thenAnswer((_) async => const Left(ApiFailure(message: "Failed", statusCode: 200)));
//         return registerBloc;
//       },
//       act: (bloc) => bloc.add(RegisterUserEvent(
//         fullName: userParams.fullName,
//         email: userParams.email,
//         password: userParams.password,
//         avatar: null,
//         context: mockContext,
//         confirmPassword: userParams.confirmPassword,
//       )),
//       expect: () => [
//         RegisterState.initial().copyWith(isLoading: true),
//         RegisterState.initial().copyWith(isLoading: false, isSuccess: false),
//       ],
//     );

//     blocTest<RegisterBloc, RegisterState>(
//       'emits [loading, success] when LoadImage is successful',
//       build: () {
//         when(() => uploadImageUsecase.call(any()))
//             .thenAnswer((_) async => const Right('uploaded_image.jpg'));
//         return registerBloc;
//       },
//       act: (bloc) => bloc.add(LoadImage(file: File('path/to/file.jpg'))),
//       expect: () => [
//         RegisterState.initial().copyWith(isLoading: true),
//         RegisterState.initial().copyWith(
//             isLoading: false, isSuccess: true, imageName: 'uploaded_image.jpg'),
//       ],
//     );

//     blocTest<RegisterBloc, RegisterState>(
//       'emits [loading, failure] when LoadImage fails',
//       build: () {
//         when(() => uploadImageUsecase.call(any()))
//             .thenAnswer((_) async => const Left(ApiFailure(message: "Failed", statusCode: 200)));
//         return registerBloc;
//       },
//       act: (bloc) => bloc.add(LoadImage(file: File('path/to/file.jpg'))),
//       expect: () => [
//         RegisterState.initial().copyWith(isLoading: true),
//         RegisterState.initial().copyWith(isLoading: false, isSuccess: false),
//       ],
//     );
//   });
// }




// import 'dart:io';

// import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:smart_movie/core/error/failure.dart';
// import 'package:smart_movie/features/auth/domain/use_case/create_user_usecase.dart';
// import 'package:smart_movie/features/auth/domain/use_case/upload_image_usecase.dart';
// import 'package:smart_movie/features/auth/presentation/view_model/signup/register_bloc.dart';

// class MockCreateUserUsecase extends Mock implements CreateUserUsecase {}

// class MockUploadImageUsecase extends Mock implements UploadImageUsecase {}

// class MockBuildContext extends Mock implements BuildContext {}

// void main() {
//   late RegisterBloc registerBloc;
//   late MockCreateUserUsecase createUserUsecase;
//   late MockUploadImageUsecase uploadImageUsecase;
//   late MockBuildContext mockContext;

//   setUp(() {
//     createUserUsecase = MockCreateUserUsecase();
//     uploadImageUsecase = MockUploadImageUsecase();
//     mockContext = MockBuildContext();

//     registerFallbackValue(const CreateUserParams(
//       fullName: '',
//       email: '',
//       password: '',
//       role: 'user',
//     ));

//     registerBloc = RegisterBloc(
//       createUserUsecase: createUserUsecase,
//       uploadImageUsecase: uploadImageUsecase,
//     );
//   });

//   tearDown(() {
//     registerBloc.close();
//   });

//   group('RegisterBloc', () {
//     const userParams = CreateUserParams(
//       fullName: 'John Doe',
//       email: 'john@example.com',
//       password: 'password123',
//       role: 'user',
//       avatar: null,
//       confirmPassword: 'password123', // Adding confirmPassword here for clarity
//     );

//     test('Initial state should be RegisterState.initial()', () {
//       expect(registerBloc.state, RegisterState.initial());
//     });

//     // Test for successful user registration
//     blocTest<RegisterBloc, RegisterState>(
//       'emits [loading, success] when RegisterUserEvent is successful',
//       build: () {
//         when(() => createUserUsecase.call(any()))
//             .thenAnswer((_) async => const Right(null));
//         return registerBloc;
//       },
//       act: (bloc) => bloc.add(RegisterUserEvent(
//         fullName: userParams.fullName,
//         email: userParams.email,
//         password: userParams.password,
//         avatar: userParams.avatar,
//         context: mockContext,
//         confirmPassword: userParams.confirmPassword,
//       )),
//       expect: () => [
//         RegisterState.initial().copyWith(isLoading: true),
//         RegisterState.initial().copyWith(isLoading: false, isSuccess: true),
//       ],
//     );

//     // Test for failed user registration
//     blocTest<RegisterBloc, RegisterState>(
//       'emits [loading, failure] when RegisterUserEvent fails',
//       build: () {
//         when(() => createUserUsecase.call(any()))
//             .thenAnswer((_) async => const Left(ApiFailure(message: "Failed", statusCode: 200)));
//         return registerBloc;
//       },
//       act: (bloc) => bloc.add(RegisterUserEvent(
//         fullName: userParams.fullName,
//         email: userParams.email,
//         password: userParams.password,
//         avatar: userParams.avatar,
//         context: mockContext,
//         confirmPassword: userParams.confirmPassword,
//       )),
//       expect: () => [
//         RegisterState.initial().copyWith(isLoading: true),
//         RegisterState.initial().copyWith(isLoading: false, isSuccess: false),
//       ],
//     );

//     // Test for successful image upload
//     blocTest<RegisterBloc, RegisterState>(
//       'emits [loading, success] when LoadImage is successful',
//       build: () {
//         when(() => uploadImageUsecase.call(any()))
//             .thenAnswer((_) async => const Right('uploaded_image.jpg'));
//         return registerBloc;
//       },
//       act: (bloc) => bloc.add(LoadImage(file: File('path/to/file.jpg'))),
//       expect: () => [
//         RegisterState.initial().copyWith(isLoading: true),
//         RegisterState.initial().copyWith(
//             isLoading: false, isSuccess: true, imageName: 'uploaded_image.jpg'),
//       ],
//     );

//     // Test for failed image upload
//     blocTest<RegisterBloc, RegisterState>(
//       'emits [loading, failure] when LoadImage fails',
//       build: () {
//         when(() => uploadImageUsecase.call(any()))
//             .thenAnswer((_) async => const Left(ApiFailure(message: "Failed", statusCode: 200)));
//         return registerBloc;
//       },
//       act: (bloc) => bloc.add(LoadImage(file: File('path/to/file.jpg'))),
//       expect: () => [
//         RegisterState.initial().copyWith(isLoading: true),
//         RegisterState.initial().copyWith(isLoading: false, isSuccess: false),
//       ],
//     );
//   });
// }
