import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_app/core/errors/exceptions.dart';
import 'package:fruit_app/core/errors/failures.dart';
import 'package:fruit_app/core/services/firebase_auth_services.dart';
import 'package:fruit_app/core/services/firestore_services.dart';
import 'package:fruit_app/core/utils/endpoint.dart';
import 'package:fruit_app/feature/auth/data/models/user_model.dart';
import 'package:fruit_app/feature/auth/domain/entites/user_entity.dart';
import 'package:fruit_app/feature/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final DatabaseServices databaseServices;

  AuthRepoImpl(
      {required this.firebaseAuthServices, required this.databaseServices});
  @override
  Future<Either<Failure, UserEntity>> createUserUsingEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
          email, password);
      var userEntity = UserEntity(
        name: name,
        email: email,
        uid: user.uid,
      );
      await addUserData(user: userEntity);
      return right(
        userEntity,
      );
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('exception in createUserUsingEmailAndPassword ${e.toString()}');
      return left(
        const ServerFailure(
          'لقد حدث خطأ ما حاول مرة ثانية',
        ),
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthServices.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginUsingEmailAndPassword(
      String email, String password) async {
    try {
      var user =
          await firebaseAuthServices.logInWithEmailAndPassword(email, password);
      var userEntity = await getUserData(uid: user.uid);
      return right(userEntity);
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
  Future<Either<Failure, UserEntity>> logInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseServices.checkIfDataExist(
        path: Endpoint.isUserExist,
        docId: userEntity.uid,
      );
      if (!isUserExist) {
        await addUserData(user: userEntity);
      }else{
        await getUserData(uid: user.uid);
      }
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('exception in signInWithGoogle ${e.toString()}');
      return left(
        const ServerFailure(
          'لقد حدث خطأ ما حاول مرة ثانية',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('exception in signInWithFacebook ${e.toString()}');
      return left(
        const ServerFailure(
          'لقد حدث خطأ ما حاول مرة ثانية',
        ),
      );
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseServices.addData(
      path: Endpoint.addUserData,
      data: user.toMap(),
      docId: user.uid,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var data = await databaseServices.getData(
      path: Endpoint.getUsreData,
      docId: uid,
    );
    return UserModel.fromJson(data);
  }
}
