import 'package:bloc/bloc.dart';
import 'package:easacc_task/models/user_model.dart';
import 'package:easacc_task/view_models/repo/auth_repo.dart';
import 'package:easacc_task/view_models/repo/auth_repo_impl.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  final AuthRepo _authRepo = AuthRepoImpl();

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    try {
      final user = await _authRepo.signInWithGoogle();
      emit(SignInSuccess(userModel: user));
    }
    // ignore: avoid_catches_without_on_clauses
    catch (e) {
      emit(SignInFailure(failure: e.toString()));
    }
  }
}
