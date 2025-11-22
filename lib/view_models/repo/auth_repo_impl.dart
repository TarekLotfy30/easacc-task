import 'dart:developer';

import 'package:easacc_task/core/services/auth_services.dart';
import 'package:easacc_task/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthService authService = AuthService();

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      final credential = await authService.signInWithGoogle();
      final UserModel userModel = UserModel.fromFirebase(credential.user!);
      return userModel;
    } on GoogleSignInException catch (e) {
      log('❌ GoogleSignInException: ${e.code} - ${e.description}');
      rethrow;
    } catch (e) {
      log('⚠️ Unexpected error: $e');
      rethrow;
    }
  }

  Future<UserModel> signInWithFacebook() {
    throw UnimplementedError();
  }
}
