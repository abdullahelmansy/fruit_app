part of 'signup_cubit.dart';

@immutable
sealed class SignupCubitState {}

final class SignupCubitInitial extends SignupCubitState {}

final class SignupCubitLoading extends SignupCubitState {}

final class SignupCubitSuccess extends SignupCubitState {
  final UserEntity userEntity;

  SignupCubitSuccess({required this.userEntity});
}

final class SignupCubitFailure extends SignupCubitState {
  final String message;

  SignupCubitFailure({required this.message});
}
