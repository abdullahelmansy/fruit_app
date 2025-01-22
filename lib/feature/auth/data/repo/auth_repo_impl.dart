import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/errors/exceptions.dart';
import 'package:fruit_app/core/errors/failures.dart';
import 'package:fruit_app/core/services/firebase_auth_services.dart';
import 'package:fruit_app/feature/auth/data/models/user_model.dart';
import 'package:fruit_app/feature/auth/domain/entites/user_entity.dart';
import 'package:fruit_app/feature/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;

  AuthRepoImpl({required this.firebaseAuthServices});
  @override
  Future<Either<Failure, UserEntity>> createUserUsingEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthServices.createUserWithEmailAndPassword(
          email, password);
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('exception in createUserUsingEmailAndPassword ${e.toString()}');
      return left(
        const ServerFailure(
          'لقد حدث خطأ ما حاول مرة ثانية',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginUsingEmailAndPassword(
      String email, String password) async {
    try {
      var user =
          await firebaseAuthServices.logInWithEmailAndPassword(email, password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('exception in loginUsingEmailAndPassword ${e.toString()}');
      return left(
        const ServerFailure(
          'لقد حدث خطأ ما حاول مرة ثانية',
        ),
      );
    }
  }
  
 
  
  
  @override
  Future<Either<Failure, UserEntity>> logInWithGoogle()async {
    try {
      var user =await firebaseAuthServices.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('exception in signInWithGoogle ${e.toString()}');
      return left(
        const ServerFailure(
          'لقد حدث خطأ ما حاول مرة ثانية',
        ),
      );
    }
  }
  
  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook()async {
    try {
      var user =await firebaseAuthServices.signInWithFacebook();
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('exception in signInWithFacebook ${e.toString()}');
      return left(
        const ServerFailure(
          'لقد حدث خطأ ما حاول مرة ثانية',
        ),
      );
    }
  }
  
}
