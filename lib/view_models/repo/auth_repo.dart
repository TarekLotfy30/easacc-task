import 'package:easacc_task/models/user_model.dart';

abstract class AuthRepo {
  Future<UserModel> signInWithFacebook();
  Future<UserModel> signInWithGoogle();
}
