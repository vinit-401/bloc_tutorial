part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent{}
class AuthLoginEvent extends AuthEvent{
  final String? email;
  final String? password;
  AuthLoginEvent({required this.email,required this.password});
}
class AuthLogOutEvent extends  AuthEvent{

}