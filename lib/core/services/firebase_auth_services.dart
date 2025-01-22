import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_app/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف جدا.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'البريد الالكتروني مستخدم مسبقا.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تحقق من اتصالك بالانترنت');
      } else {
        throw CustomException(message: 'لقد حدث خطأ ما.');
      }
    } catch (e) {
      throw CustomException(message: 'لقد حدث خطأ ما.');
    }
  }

  Future<User> logInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(
            message: 'الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تحقق من اتصالك بالانترنت');
      } else {
        throw CustomException(message: 'لقد حدث خطأ ما.');
      }
    } catch (e) {
      throw CustomException(message: 'لقد حدث خطأ ما.');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }
  Future<User> signInWithFacebook() async {
  final LoginResult loginResult = await FacebookAuth.instance.login();

  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

  return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
}
}
