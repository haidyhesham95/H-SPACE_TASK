
abstract class AuthState {
  final String? email;
  final String? error;

  const AuthState({this.email, this.error});
}

class AuthInitial extends AuthState {
  const AuthInitial() : super();
}

class AuthLoading extends AuthState {
  const AuthLoading() : super();
}

class AuthAuthenticated extends AuthState {
  const AuthAuthenticated(String email) : super(email: email);
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated({super.error});
}