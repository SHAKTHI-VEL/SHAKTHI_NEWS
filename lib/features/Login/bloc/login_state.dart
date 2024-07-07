part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

class LoginActionState extends LoginState{}

class LoginInitial extends LoginState {}

class NavigateToForgotPassword extends LoginActionState{}

class NavigateToSignup extends LoginActionState{}

class NavigateToMainScreen extends LoginActionState{}

class ShowWrongPasswordSnackbar extends LoginState{
  final String message;

  ShowWrongPasswordSnackbar({required this.message});
}