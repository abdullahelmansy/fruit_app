import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/errors/failures.dart';
import 'package:fruit_app/feature/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserUsingEmailAndPassword(
      String email, String password, String name);
  Future<Either<Failure, UserEntity>> loginUsingEmailAndPassword(
      String email, String password);
  Future<Either<Failure, UserEntity>> logInWithGoogle();
  Future<Either<Failure, UserEntity>> loginWithFacebook();
  Future addUserData({required UserEntity user});
  Future <UserEntity> getUserData({required String uid});
}
