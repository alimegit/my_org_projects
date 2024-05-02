import 'package:default_project/data/models/network_response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../exceptions/exceptions.dart';

class AuthRepository {
  Future<NetworkResponse> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return NetworkResponse(data: "success");
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
          errorText: LogInWithEmailAndPasswordFailure.fromCode(e.code).message, errorCode: e.code);
    } catch (_) {
      return NetworkResponse(errorText: "An unknown exception occurred");
    }
  }
  Future<NetworkResponse> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return NetworkResponse(data: "success");
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
          errorText: SignUpWithEmailAndPasswordFailure.fromCode(e.code).message, errorCode: e.code);
    } catch (_) {
      return NetworkResponse(errorText: "An unknown exception occurred");
    }
  }
  Future<NetworkResponse> logOutUser() async {
    try {
      await FirebaseAuth.instance.signOut(
      );
      return NetworkResponse(data: "success");
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
          errorText: "Error logOut");
    } catch (_) {
      return NetworkResponse(errorText: "An unknown exception occurred");
    }
  }
  Future<NetworkResponse> googleSignIn() async {
    try {
     late final AuthCredential credential;
     final googleUser = await GoogleSignIn().signIn();
     final googleAuth =  await googleUser!.authentication;
     credential  = GoogleAuthProvider.credential(
       accessToken: googleAuth.accessToken,
       idToken: googleAuth.idToken
     );
     UserCredential userCredential  =  await FirebaseAuth.instance.signInWithCredential(credential);
      return NetworkResponse(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
          errorText: LogInWithEmailAndPasswordFailure.fromCode(e.code).message, errorCode: e.code);
    } catch (_) {
      return NetworkResponse(errorText: "An unknown exception occurred");
    }
  }
}
