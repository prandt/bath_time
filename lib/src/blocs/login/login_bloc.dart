import 'package:bloc/bloc.dart';
import 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(const LoginEmptyEmail());

  void _setInvalidEmail() async {
    emit(const LoginInvalidEmail());
    await Future.delayed(const Duration(seconds: 2));
    emit(const LoginEmptyEmail());
  }

  void validEmail(String email) async {
    emit(const LoginLoading(email: ''));
    await Future.delayed(const Duration(milliseconds: 500));
    if (email.isEmpty) {
      emit(const LoginEmptyEmail());
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      _setInvalidEmail();
    } else {
      emit(LoginValidEmail(email: email));
    }
  }

  void toggleLockPassword() {
    emit(LoginValidEmail(email: state.email, isLockPassword: !state.isLockPassword));
  }
}