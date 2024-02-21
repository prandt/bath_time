sealed class LoginState {
  final String email;
  final bool isLockPassword;
  const LoginState({required this.email, this.isLockPassword = true});
}

final class LoginEmptyEmail extends LoginState {
  const LoginEmptyEmail() : super(email: '');
}

final class LoginInvalidEmail extends LoginState {
  const LoginInvalidEmail() : super(email: '');
}

final class LoginValidEmail extends LoginState {
  const LoginValidEmail({required String email, bool? isLockPassword})
      : super(email: email, isLockPassword: isLockPassword ?? true);
}

final class LoginLoading extends LoginState {
  const LoginLoading({required String email}) : super(email: email);
}

final class LoginError extends LoginState {
  final String error;
  const LoginError({required String email, required this.error}) : super(email: email);
}

final class LoginSuccess extends LoginState {
  const LoginSuccess({required String email}) : super(email: email);
}
