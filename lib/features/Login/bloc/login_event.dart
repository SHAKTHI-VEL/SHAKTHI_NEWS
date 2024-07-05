part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginButtonClicked extends LoginEvent{
  final String email;
  final String password;

  LoginButtonClicked({required this.email, required this.password});
}

class ForgotPasswordButtonClicked extends LoginEvent{}

class SignupButtonClicked extends LoginEvent{}

