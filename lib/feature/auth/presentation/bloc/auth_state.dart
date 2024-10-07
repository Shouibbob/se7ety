class AuthState {}

class AuthInitial extends AuthState {}

//Login

class LoginSuccessState extends AuthState {}

class LoginLoadingState extends AuthState {}

// Register

class RegisterSuccessState extends AuthState {}

class RegisterLoadingState extends AuthState {}

// Auth Error

class AuthErrorState extends AuthState {
  final String error;
  AuthErrorState(this.error);
}
