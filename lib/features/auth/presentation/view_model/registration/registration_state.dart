import 'package:equatable/equatable.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object?> get props => [];
}

// Initial State
class RegistrationInitial extends RegistrationState {}

// Loading State
class RegistrationLoading extends RegistrationState {}

// Success State
class RegistrationSuccess extends RegistrationState {
  final String message;

  const RegistrationSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

// Error State
class RegistrationError extends RegistrationState {
  final String error;

  const RegistrationError(this.error);

  @override
  List<Object?> get props => [error];
}
