import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:rx_change_3/src/features/core/screens/loginSignup/loginScreen.dart';
import 'package:rx_change_3/src/repository/exceptions/signUpEmailPasswordFailure.dart';

import '../features/authentification/biometricAuthentification.dart';
import '../features/core/screens/loginSignUp/WelcomeScreen.dart';

class AuthentificationRepository extends GetxController {
  static AuthentificationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void OnReady() {
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const LoginprintApp());
  }

  Future<void> createUserWithEmailPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const LoginprintApp())
          : Get.to(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print(' EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginUserWithEmailPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
