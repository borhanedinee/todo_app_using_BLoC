part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

//Google login
final class GoogleLoginLoading extends AuthState {}

final class GoogleLoginSuccess extends AuthState {
  final String message;
  final User user;

  GoogleLoginSuccess({required this.user, required this.message});
}

final class GoogleLoginFailed extends AuthState {
  final String message;

  GoogleLoginFailed({required this.message});
}

// NORMAL LOGIN
final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final String message;
  final User? user;

  AuthSuccess({required this.user, required this.message});
}

final class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
