import 'package:fruit_app/core/services/firebase_auth_services.dart';
import 'package:fruit_app/core/services/firestore_services.dart';
import 'package:fruit_app/feature/auth/data/repo/auth_repo_impl.dart';
import 'package:fruit_app/feature/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<DatabaseServices>(FirestoreServices());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthServices: getIt<FirebaseAuthServices>(),
      databaseServices: getIt<DatabaseServices>(),
    ),
  );
}
