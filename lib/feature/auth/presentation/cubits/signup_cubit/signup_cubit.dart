import 'package:bloc/bloc.dart';
import 'package:fruit_app/feature/auth/domain/entites/user_entity.dart';
import 'package:fruit_app/feature/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupCubitState> {
  SignupCubit(this.finalAuthRepo) : super(SignupCubitInitial());
  final AuthRepo finalAuthRepo;
  Future<void> createUserUsingEmailAndPassword(
      String email, String password, String name) async {
    emit(SignupCubitLoading());
    final result = await finalAuthRepo.createUserUsingEmailAndPassword(
        email, password, name);
    result.fold(
      (failure) => emit(SignupCubitFailure(message:  failure.message)),
      (userEntity) => emit(SignupCubitSuccess(userEntity: userEntity)),
    );
  }
}
  

