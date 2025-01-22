import 'package:bloc/bloc.dart';
import 'package:fruit_app/feature/auth/domain/entites/user_entity.dart';
import 'package:fruit_app/feature/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;
  Future<void> loginUsingEmailAndPassword(String email, String password) async {
    emit(LoginCubitLoading());
    final result = await authRepo.loginUsingEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(LoginCubitFailure(message: failure.message)),
      (userEntity) => emit(LoginCubitSuccess(userEntity: userEntity)),
    );
  }

  Future<void> logInWithGoogle() async {
    emit(LoginCubitLoading());
    final result = await authRepo.logInWithGoogle();
    result.fold(
      (failure) => emit(LoginCubitFailure(message: failure.message)),
      (userEntity) => emit(LoginCubitSuccess(userEntity: userEntity)),
    );
  }

  Future<void> loginWithFacebook() async {
    emit(LoginCubitLoading());
    final result = await authRepo.loginWithFacebook();
    result.fold(
      (failure) => emit(LoginCubitFailure(message: failure.message)),
      (userEntity) => emit(LoginCubitSuccess(userEntity: userEntity)),
    );
  }
}
