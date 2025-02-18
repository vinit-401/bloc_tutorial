part of 'auth_bloc.dart';

@immutable
sealed class AuthState{
}
class AuthInitial extends AuthState{
  // splash ..
}
class AuthLoading extends AuthState{}
class AuthSuccess extends AuthState{
  final String token;
  AuthSuccess({required this.token});

}
class AuthFailure extends AuthState{
  final String errorMessage;
  AuthFailure({required this.errorMessage});
}