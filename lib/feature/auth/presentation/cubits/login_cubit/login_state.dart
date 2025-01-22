part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginCubitSuccess extends LoginState {
  final UserEntity userEntity;
  LoginCubitSuccess({required this.userEntity});
}

class LoginCubitFailure extends LoginState {
  final String message;
  LoginCubitFailure({required this.message});
}

class LoginCubitLoading extends LoginState {}
